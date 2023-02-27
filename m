Return-Path: <virtio-comment-return-4560-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44CF1986478
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Feb 2023 14:54:41 +0000 (UTC)
From: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>
Date: Mon, 27 Feb 2023 14:53:55 +0000
Message-ID: <1677509635629.14571@harman.com>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <20230113073710-mutt-send-email-mst@kernel.org>
 <1673968792585.39097@harman.com>,<CAJaqyWc-gEJGexf-h6OCez2NWg+L0aVeq=0y9tzFvDxmVkdkoQ@mail.gmail.com>
In-Reply-To: <CAJaqyWc-gEJGexf-h6OCez2NWg+L0aVeq=0y9tzFvDxmVkdkoQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Introduce VIRTIO_F_ISOLATE_INDIRECT_DESC
 feature
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

> Hi Baptiste,=0A>=0A> It is not the current way of working for shadow virt=
queue in qemu, but=0A> it is doable.=0A>=0A> QEMU offers a new address spac=
e to the device, including all the guest=0A> memory and the shadow vrings i=
n qemu memory. By default, qemu=0A> translates each descriptor to this new =
address space and copies it in=0A> the shadow vring, making sure it's a val=
id guest address.=0A>=0A> Net CVQ is a special case, as qemu copies also th=
e buffer so a=0A> malicious guest will not be able to change it and make vd=
pa device and=0A> qemu's knowledge of it out of sync. This is done in a reg=
ion mapped at=0A> device start for this purpose for performance and simplic=
ity, not for=0A> each descriptor.=0A>=0A> It is technically possible to dev=
elop the copy of the buffer content=0A> in a memory region too. Once a suit=
able size is agreed (or given by a=0A> parameter in cmdline, for example), =
SVQ already supports things like=0A> backoff in case this region is full. T=
o malloc and map this region=0A> dynamically is also possible.=0A>=0A=0AHel=
lo Eugenio,=0A=0AThanks for the insight. It does have some similarities wit=
h what we have done on=0Aour side.=0A=0AWe have also tried the approach of =
doing a copy of the buffer content into a=0Ashared memory region but we did=
 that on the guest side using things like the=0Aswiotlb or restricted DMA p=
ools. This works well when buffers are small, but=0Awhen they get larger, w=
e get better performance by granting the memory=0Adynamically.=0A=0A> > Thi=
s new feature bit helps supporting indirect=0A> > descriptors in this conte=
xt.=0A> >=0A> > When an indirect descriptor is added to a virtqueue, we nee=
d to "share" the=0A> > indirect descriptor table in addition to the buffers=
 themselves. To do this we=0A> > have two options:=0A> >=0A> >   - Share a =
shadow copy of the table with the device but this requires some kind=0A> > =
    of dynamic memory allocation in the hypervisor.=0A> >=0A> >   - Grant t=
he indirect descriptor table from the guest as-is. Note that in our=0A> >  =
   use case we do not translate buffer addresses when importing them into t=
he=0A> >     device address space.=0A> >=0A>=0A> The plan with indirect des=
criptors is similar to CVQ buffer treatment:=0A> To preallocate a big enoug=
h chunk of memory able to hold a copy of the=0A> indirect table and then tr=
anslate each descriptor. The current dynamic=0A> allocation scheme is very =
simple but it should work as long as there=0A> is enough memory. As comment=
ed before, backoff is already available=0A> for other cases.=0A=0AOk. This =
is one of the options we considered initially, but that we rejected=0Abecau=
se we wanted to avoid dynamic memory allocation.=0A=0AHowever, we are recon=
sidering this idea now. We initially overlooked the fact=0Athat the spec li=
mits the size of an indirect descriptor table to the queue=0Asize. Having t=
his allows us to figure out the maximum size for a single indirect=0Adescri=
ptor table and the total size needed for the memory pool that will store=0A=
the copies of the indirect descriptor tables.=0A=0AThe issue that we have n=
ow, is that this limitation does not seem to be enforced=0Ain Linux virtio =
drivers today. I came across:=0A=0Ahttps://github.com/oasis-tcs/virtio-spec=
/issues/122=0A=0Awhich looks like a good base for us to build upon, but I'm=
 not sure what is the=0Astatus with this issue. Do you know whether there i=
s any plan regarding this?=0A=0A> Going a step forward with current qemu's =
SVQ, a feature that would=0A> help is to allow the device to translate buff=
ers addresses with a=0A> different IOVA from vring and indirect table. But =
this is far from=0A> standard POV, since it does not have even an address s=
pace concept.=0A=0AI'm not sure to see what this would bring compared to th=
e current design.=0A=0A> Do you think both modes can converge?=0A=0AI think=
 so since we are now thinking of using a copy of the indirect descriptor=0A=
table. This would eliminate the need for any additional feature bit.=0A=0A>=
 > The issue with the second option is that we need to ensure that the driv=
er will=0A> > not modify the indirect descriptor table while it is on the d=
evice side.=0A> > Otherwise the device could attempt to access the buffers =
using the new addresses=0A> > which would not correspond to the one the hyp=
ervisor used when granting memory.=0A> >=0A> > Since this is something that=
 a correct driver implementation would not do, this=0A> > led to the idea o=
f remapping the table read-only while it is used by the device.=0A> > Becau=
se an indirect descriptor table may not fill an entire page, we needed a=0A=
> > way to ensure that the OS would not re-use the rest of these pages for =
other=0A> > purposes while we have made them read-only.=0A> >=0A>=0A> How d=
o you guarantee it for vring itself?=0A=0AFor the vrings we do exactly what=
 you described for QEMU. The virtqueues that=0Athe device sees are not the =
virtqueues allocated by the driver but the shadow=0Acopies managed by the h=
ypervisor. If the driver touches the descriptors after=0Athey have been cop=
ied to the shadow virtqueue, the hypervisor will ignore these=0Achanges.=0A=
=0AThanks.
This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

