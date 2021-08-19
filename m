Return-Path: <dgilbert@redhat.com>
Date: Thu, 19 Aug 2021 15:24:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Message-ID: <YR5pgsRf3p4rBwnc@work-vm>
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
 <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com>
 <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com>
 <YR48goPkf7scGwjA@work-vm>
 <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
> 
> On 8/19/2021 2:12 PM, Dr. David Alan Gilbert wrote:
> > * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
> > > On 8/18/2021 1:46 PM, Jason Wang wrote:
> > > > On Wed, Aug 18, 2021 at 5:16 PM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> > > > > On 8/17/2021 12:44 PM, Jason Wang wrote:
> > > > > > On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> > > > > > > On 8/17/2021 11:51 AM, Jason Wang wrote:
> > > > > > > > 在 2021/8/12 下午8:08, Max Gurtovoy 写道:
> > > > > > > > > Hi all,
> > > > > > > > > 
> > > > > > > > > Live migration is one of the most important features of
> > > > > > > > > virtualization and virtio devices are oftenly found in virtual
> > > > > > > > > environments.
> > > > > > > > > 
> > > > > > > > > The migration process is managed by a migration SW that is running on
> > > > > > > > > the hypervisor and the VM is not aware of the process at all.
> > > > > > > > > 
> > > > > > > > > Unlike the vDPA case, a real pci Virtual Function state resides in
> > > > > > > > > the HW.
> > > > > > > > > 
> > > > > > > > vDPA doesn't prevent you from having HW states. Actually from the view
> > > > > > > > of the VMM(Qemu), it doesn't care whether or not a state is stored in
> > > > > > > > the software or hardware. A well designed VMM should be able to hide
> > > > > > > > the virtio device implementation from the migration layer, that is how
> > > > > > > > Qemu is wrote who doesn't care about whether or not it's a software
> > > > > > > > virtio/vDPA device or not.
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > In our vision, in order to fulfil the Live migration requirements for
> > > > > > > > > virtual functions, each physical function device must implement
> > > > > > > > > migration operations. Using these operations, it will be able to
> > > > > > > > > master the migration process for the virtual function devices. Each
> > > > > > > > > capable physical function device has a supervisor permissions to
> > > > > > > > > change the virtual function operational states, save/restore its
> > > > > > > > > internal state and start/stop dirty pages tracking.
> > > > > > > > > 
> > > > > > > > For "supervisor permissions", is this from the software point of view?
> > > > > > > > Maybe it's better to give an example for this.
> > > > > > > A permission to a PF device for quiesce and freeze a VF device for example.
> > > > > > Note that for safety, VMM (e.g Qemu) is usually running without any privileges.
> > > > > You're mixing layers here.
> > > > > 
> > > > > QEMU is not involved here. It's only sending IOCTLs to migration driver.
> > > > > The migration driver will control the migration process of the VF using
> > > > > the PF communication channel.
> > > > So who will be granted the "permission" you mentioned here?
> > > This is just an expression.
> > > 
> > > What is not clear ?
> > > 
> > > The PF device will have an option to quiesce/freeze the VF device.
> > > 
> > > This is simple. Why are you looking for some sophisticated problems ?
> > I'm trying to follow along here and have not completely; but I think the issue is a
> > security separation one.
> > The VMM (e.g. qemu) that has been given access to one of the VF's is
> > isolated and shouldn't be able to go poking at other devices; so it
> > can't go poking at the PF (it probably doesn't even have the PF device
> > node accessible) - so then the question is who has access to the
> > migration driver and how do you make sure it can only deal with VF's
> > that it's supposed to be able to migrate.
> 
> The QEMU/userspace doesn't know or care about the PF connection and internal
> virtio_vfio_pci driver implementation.

OK

> You shouldn't change 1 line of code in the VM driver nor in QEMU.

Hmm OK.

> QEMU does not have access to the PF. Only the kernel driver that has access
> to the VF will have access to the PF communication channel.  There is no
> permission problem here.
>
> The kernel driver of the VF will do this internally, and make sure that the
> commands it build will only impact the VF originating them.
> 

Now that confuses me; isn't the kernel driver that has access to the VF
running inside the guest?  If it's inside the guest we can't trust it to
do anything about stopping impact to other devices.

Dave


> We already do this in mlx5 NIC migration. The kernel is secured and QEMU
> interface is the VF.
> 
> > Dave
> > 
> > > > > > > > > An example of this approach can be seen in the way NVIDIA performs
> > > > > > > > > live migration of a ConnectX NIC function:
> > > > > > > > > 
> > > > > > > > > https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
> > > > > > > > > <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
> > > > > > > > > 
> > > > > > > > > NVIDIAs SNAP technology enables hardware-accelerated software defined
> > > > > > > > > PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for storage
> > > > > > > > > and networking solutions. The host OS/hypervisor uses its standard
> > > > > > > > > drivers that are implemented according to a well-known VIRTIO
> > > > > > > > > specifications.
> > > > > > > > > 
> > > > > > > > > In order to implement Live Migration for these virtual function
> > > > > > > > > devices, that use a standard drivers as mentioned, the specification
> > > > > > > > > should define how HW vendor should build their devices and for SW
> > > > > > > > > developers to adjust the drivers.
> > > > > > > > > 
> > > > > > > > > This will enable specification compliant vendor agnostic solution.
> > > > > > > > > 
> > > > > > > > > This is exactly how we built the migration driver for ConnectX
> > > > > > > > > (internal HW design doc) and I guess that this is the way other
> > > > > > > > > vendors work.
> > > > > > > > > 
> > > > > > > > > For that, I would like to know if the approach of “PF that controls
> > > > > > > > > the VF live migration process” is acceptable by the VIRTIO technical
> > > > > > > > > group ?
> > > > > > > > > 
> > > > > > > > I'm not sure but I think it's better to start from the general
> > > > > > > > facility for all transports, then develop features for a specific
> > > > > > > > transport.
> > > > > > > a general facility for all transports can be a generic admin queue ?
> > > > > > It could be a virtqueue or a transport specific method (pcie capability).
> > > > > No. You said a general facility for all transports.
> > > > For general facility, I mean the chapter 2 of the spec which is general
> > > > 
> > > > "
> > > > 2 Basic Facilities of a Virtio Device
> > > > "
> > > > 
> > > It will be in chapter 2. Right after "2.11 Exporting Object" I can add "2.12
> > > Admin Virtqueues" and this is what I did in the RFC.
> > > 
> > > > > Transport specific is not general.
> > > > The transport is in charge of implementing the interface for those facilities.
> > > Transport specific is not general.
> > > 
> > > 
> > > > > > E.g we can define what needs to be migrated for the virtio-blk first
> > > > > > (the device state). Then we can define the interface to get and set
> > > > > > those states via admin virtqueue. Such decoupling may ease the future
> > > > > > development of the transport specific migration interface.
> > > > > I asked a simple question here.
> > > > > 
> > > > > Lets stick to this.
> > > > I answered this question.
> > > No you didn't answer.
> > > 
> > > I asked  if the approach of “PF that controls the VF live migration process”
> > > is acceptable by the VIRTIO technical group ?
> > > 
> > > And you take the discussion to your direction instead of answering a Yes/No
> > > question.
> > > 
> > > >     The virtqueue could be one of the
> > > > approaches. And it's your responsibility to convince the community
> > > > about that approach. Having an example may help people to understand
> > > > your proposal.
> > > > 
> > > > > I'm not referring to internal state definitions.
> > > > Without an example, how do we know if it can work well?
> > > > 
> > > > > Can you please not change the subject of my initial intent in the email ?
> > > > Did I? Basically, I'm asking how a virtio-blk can be migrated with
> > > > your proposal.
> > > The virtio-blk PF admin queue will be used to manage the virtio-blk VF
> > > migration.
> > > 
> > > This is the whole discussion. I don't want to get into resolution.
> > > 
> > > Since you already know the answer as I published 4 RFCs already with all the
> > > flow.
> > > 
> > > Lets stick to my question.
> > > 
> > > > Thanks
> > > > 
> > > > > Thanks.
> > > > > 
> > > > > 
> > > > > > Thanks
> > > > > > 
> > > > > > > > Thanks
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > Cheers,
> > > > > > > > > 
> > > > > > > > > -Max.
> > > > > > > > > 
> > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > 
> > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > before posting.
> > > > > > > 
> > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > List archive: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113731308%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=l%2FVw755FQgN6%2BunOXoNRummuOWky%2Feh0xcITkNemXvE%3D&amp;reserved=0
> > > > > > > Feedback License: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113731308%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tlaAvXlxAXCdN3E%2F%2BH1%2Bb3t2C3jgQUofXTXGmrq5ug8%3D&amp;reserved=0
> > > > > > > List Guidelines: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113741261%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=gWzhW9NEeeYiE3oJl5ZTzBui1tIqEzYw%2FuV59qiBqzw%3D&amp;reserved=0
> > > > > > > Committee: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ccZibMmYiCnFVUQ4QeCexz8OQUsvdeC9dlr1aaRnXhg%3D&amp;reserved=0
> > > > > > > Join OASIS: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=O7T8D2Y6xzCLp%2FceWqiRoriTh0M6IBeMPLpfb7d3zvA%3D&amp;reserved=0
> > > > > > > 
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > 
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > > 
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=apuVb9a9YN2itMje3TXj1ZtwFWm9%2FPQ%2BVfrL%2BoNHzOc%3D&amp;reserved=0
> > > Feedback License: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=8Pl4yjzImSQV3YdXl8o7LUOI70I6%2BS78kORP1%2BbOZaU%3D&amp;reserved=0
> > > List Guidelines: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=IcvHERzgz0h2oUleoQXpPk%2FPpf0CGVpNA74zc%2FpSDRQ%3D&amp;reserved=0
> > > Committee: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ccZibMmYiCnFVUQ4QeCexz8OQUsvdeC9dlr1aaRnXhg%3D&amp;reserved=0
> > > Join OASIS: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7C012299d734484885c90308d96302337e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649684113930443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=O7T8D2Y6xzCLp%2FceWqiRoriTh0M6IBeMPLpfb7d3zvA%3D&amp;reserved=0
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

