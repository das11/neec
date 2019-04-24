<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ScriptVersion extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'script:version {version}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command to version the script';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
       $version = $this->argument('version');
       $folder = 'knap'.$version;
       $path = '../versions/'.$folder;
       $local = '../dev/';

       $this->info('Creating Versions....');
       $this->info('Removing Old '.$folder.' folder to create the '.$folder);
       echo  exec('rm -rf '.$path.'/');

       $this->info('Creating the directory '.$folder.'/script');
       echo  exec('mkdir -p '.$path.'/script');

       $this->info('Copying files from '.$local.' '.$path.'/script');
       echo  exec('rsync -av --progress '.$local.' '.$path.'/script --exclude=".git" --exclude=".phpintel" --exclude=".gitlab-ci.yml" --exclude="node_modules" ');

       $this->info('Creating the directory '.$path.'/script');
       echo  exec('mkdir -p '.$path.'/script');

       $this->info('Removing installed');
       echo  exec('rm -rf '.$path.'/script/storage/installed');

       $this->info('Removing symlink');
       echo  exec('rm -rf '.$path.'/script/public/storage');

       $this->info('Moving script/documentation to separate folder');
       echo  exec('mv '.$path.'/script/documentation '.$path.'/documentation/');
    
       // Zipping the folder 
       $this->info('Zipping the folder');
       echo  exec('cd ../versions; zip -r '.$folder.'.zip '.$folder.'/');
    }
}