Return-Path: <virtio-comment-return-2878-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A154E986724
	for <virtio-comment@lists.oasis-open.org>; Sun,  3 Apr 2022 01:38:25 +0000 (UTC)
From: "Pincus, Josh" <Josh.Pincus@windriver.com>
Date: Sun, 3 Apr 2022 01:38:21 +0000
Message-ID: <DM6PR11MB43313B1483050830302871B4F9E29@DM6PR11MB4331.namprd11.prod.outlook.com>
References: <DM6PR11MB43316D69A8BE7ABE8E868C37F9E09@DM6PR11MB4331.namprd11.prod.outlook.com>
 <Ykh9BEEm+/tjAcFf@stefanha-x1.localdomain>
In-Reply-To: <Ykh9BEEm+/tjAcFf@stefanha-x1.localdomain>
MIME-Version: 1.0
Subject: RE: [virtio-comment] Is there a protocol for interacting with a Linux
 Host where another Linux guest is the virtio guest?
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

Thank you very much for the content below.  Methinks you have addressed my =
question.  The PDF, in particular, seems to speak to my questions.

JP

-----Original Message-----
From: Stefan Hajnoczi <stefanha@redhat.com>=20
Sent: Saturday, April 2, 2022 12:43 PM
To: Pincus, Josh <Josh.Pincus@windriver.com>
Cc: virtio-comment@lists.oasis-open.org
Subject: Re: [virtio-comment] Is there a protocol for interacting with a Li=
nux Host where another Linux guest is the virtio guest?

On Fri, Apr 01, 2022 at 03:47:31PM +0000, Pincus, Josh wrote:
> HI,
>=20
> Thanks in advance for all the newbie help, especially to Stefan who graci=
ously responded yesterday.
>=20
> The current spec doesn't say a word about what's presented to the Linux H=
ost (see attached graphic).  It speaks directly to what's presented to the =
Linux Guest, the user of the virtual device.  By Linux Host, I mean the VM =
responsible for virtualizing the actual hardware and providing a "virtio de=
vice" that receives raw content via the queues from the guest, translates t=
he content into commands that can be understood by the hardware device driv=
er in question, and eventually sends back responses to the guest.  What sta=
ndard or interface is used by compliant HYPs to configure the Linux Host to=
 fire up a virtual device, negotiate with the guest based on features the H=
OST supports, respond to register reads/writes performed by the guest, and =
initiate interrupts back to the guest as needed? =20
>=20
> Is there any kind of standard or documentation that governs how compliant=
 Hypervisors are supposed to present such an interface to the Linux Host?  =
Are folks using vhost in the Linux Host to provide an interface to the Host=
's virtio device and then relying on the HYP to interact with that service =
when the Guest makes register requests? =20

That is beyond the scope of the VIRTIO specification because it varies depe=
nding on the details of the hypervisor.

You said "the VM responsible for virtualizating the actual hardware".
The VIRTIO device may or may not be in a VM. It could be part of the hyperv=
isor, passed through to hardware, etc.

If you look at QEMU, kvmtool, Firecracker, and other VMMs, they implement V=
IRTIO devices using internal APIs and there is no standard.

There are some interfaces for specific use cases: vhost, vhost-user, vDPA, =
VDUSE, etc. They are sometimes called "out-of-process device emulation" int=
erfaces and potentially allow you to implement a VIRTIO device once and use=
 it across multiple hypervisors. Here are slides that cover recent options =
in the Linux world:
https://vmsplice.net/~stefan/VHPC%202021%20-%20Bring%20your%20own%20virtual=
%20devices.pdf

It's typical for QEMU KVM guests to have a mix of vhost kernel and QEMU VIR=
TIO devices (host userspace). That's because certain things are better done=
 in the host kernel and therefore implemented as vhost drivers. Other thing=
s don't benefit from being in the kernel and implementing them as part of Q=
EMU (or a vhost-user device) is a natural choice.

To summarize: there is no one-size-fits-all standard but check your specifi=
c use case to see if an out-of-process device emulation interface would be =
a good fit.

Stefan

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

