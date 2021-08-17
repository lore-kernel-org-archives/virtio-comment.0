Return-Path: <jasowang@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
Date: Tue, 17 Aug 2021 16:51:39 +0800
MIME-Version: 1.0
In-Reply-To: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/12 下午8:08, Max Gurtovoy 写道:
>
> Hi all,
>
> Live migration is one of the most important features of virtualization 
> and virtio devices are oftenly found in virtual environments.
>
> The migration process is managed by a migration SW that is running on 
> the hypervisor and the VM is not aware of the process at all.
>
> Unlike the vDPA case, a real pci Virtual Function state resides in the HW.
>

vDPA doesn't prevent you from having HW states. Actually from the view 
of the VMM(Qemu), it doesn't care whether or not a state is stored in 
the software or hardware. A well designed VMM should be able to hide the 
virtio device implementation from the migration layer, that is how Qemu 
is wrote who doesn't care about whether or not it's a software 
virtio/vDPA device or not.


> In our vision, in order to fulfil the Live migration requirements for 
> virtual functions, each physical function device must implement 
> migration operations. Using these operations, it will be able to 
> master the migration process for the virtual function devices. Each 
> capable physical function device has a supervisor permissions to 
> change the virtual function operational states, save/restore its 
> internal state and start/stop dirty pages tracking.
>

For "supervisor permissions", is this from the software point of view? 
Maybe it's better to give an example for this.


> An example of this approach can be seen in the way NVIDIA performs 
> live migration of a ConnectX NIC function:
>
> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci 
> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
>
> NVIDIAs SNAP technology enables hardware-accelerated software defined 
> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for storage 
> and networking solutions. The host OS/hypervisor uses its standard 
> drivers that are implemented according to a well-known VIRTIO 
> specifications.
>
> In order to implement Live Migration for these virtual function 
> devices, that use a standard drivers as mentioned, the specification 
> should define how HW vendor should build their devices and for SW 
> developers to adjust the drivers.
>
> This will enable specification compliant vendor agnostic solution.
>
> This is exactly how we built the migration driver for ConnectX 
> (internal HW design doc) and I guess that this is the way other 
> vendors work.
>
> For that, I would like to know if the approach of “PF that controls 
> the VF live migration process” is acceptable by the VIRTIO technical 
> group ?
>

I'm not sure but I think it's better to start from the general facility 
for all transports, then develop features for a specific transport.

Thanks


> Cheers,
>
> -Max.
>

