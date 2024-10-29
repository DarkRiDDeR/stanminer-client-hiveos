import tarfile

def chmodx(tarinfo):
    tarinfo.mode = int('0755', base=8)
    return tarinfo

f = tarfile.open('stanstart-0.0.1alpha.tar.gz', 'w:gz')
f.add('h-config.sh', arcname='/stanstart/h-config.sh', filter=chmodx)
f.add('h-manifest.conf' , arcname='/stanstart/h-manifest.conf', filter=chmodx)
f.add('h-run.sh' , arcname='/stanstart/h-run.sh', filter=chmodx)
f.add('h-stats.sh' , arcname='/stanstart/h-stats.sh', filter=chmodx)
f.list()
f.close()