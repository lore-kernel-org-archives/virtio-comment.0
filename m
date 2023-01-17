Return-Path: <virtio-comment-return-3858-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24D91986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 15:20:39 +0000 (UTC)
From: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>
Date: Tue, 17 Jan 2023 15:19:52 +0000
Message-ID: <1673968792585.39097@harman.com>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>,<20230113073710-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230113073710-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Introduce VIRTIO_F_ISOLATE_INDIRECT_DESC
 feature
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, =?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> I missed this when this was posted :( Creating the github issue=0A> drew =
my attention to it. Replying now.=0A>=20=0A> I also CC Eugenio who seems to=
 have implemented shadow VQs in QEMU=0A> (motivation for this patch) withou=
t need for new feature bits.=0A>=0A=0AHello Michael,=0A=0ANo worries, thank=
s for the review!=0A=0AI didn't know there was such support in QEMU. I'll l=
ook at it in more details=0Abecause it is not clear to me whether we are ta=
lking about the same thing or=0Anot.=0A=0AKeep in mind that we use shadow v=
irtqueues in a context where the device do not=0Ahave full access to the me=
mory of the guest where the driver runs. Instead we=0Agrant buffers to the =
device transparently from the hypervisor as buffers are=0Aadded to the virt=
queues. This new feature bit helps supporting indirect=0Adescriptors in thi=
s context.=0A=0AWhen an indirect descriptor is added to a virtqueue, we nee=
d to "share" the=0Aindirect descriptor table in addition to the buffers the=
mselves. To do this we=0Ahave two options:=0A=0A  - Share a shadow copy of =
the table with the device but this requires some kind=0A    of dynamic memo=
ry allocation in the hypervisor.=0A=0A  - Grant the indirect descriptor tab=
le from the guest as-is. Note that in our=0A    use case we do not translat=
e buffer addresses when importing them into the=0A    device address space.=
=0A=0AThe issue with the second option is that we need to ensure that the d=
river will=0Anot modify the indirect descriptor table while it is on the de=
vice side.=0AOtherwise the device could attempt to access the buffers using=
 the new addresses=0Awhich would not correspond to the one the hypervisor u=
sed when granting memory.=0A=0ASince this is something that a correct drive=
r implementation would not do, this=0Aled to the idea of remapping the tabl=
e read-only while it is used by the device.=0ABecause an indirect descripto=
r table may not fill an entire page, we needed a=0Away to ensure that the O=
S would not re-use the rest of these pages for other=0Apurposes while we ha=
ve made them read-only.=0A=0A> > ---=0A> >  content.tex | 26 ++++++++++++++=
++++++++++++=0A> >  1 file changed, 26 insertions(+)=0A> >=0A> > diff --git=
 a/content.tex b/content.tex=0A> > index e863709..20e17b7 100644=0A> > --- =
a/content.tex=0A> > +++ b/content.tex=0A> > @@ -6944,6 +6944,23 @@ \chapter=
{Reserved Feature Bits}\label{sec:Reserved Feature Bits}=0A> >    that the =
driver can reset a queue individually.=0A> >    See \ref{sec:Basic Faciliti=
es of a Virtio Device / Virtqueues / Virtqueue Reset}.=0A> >=20=0A> > +  \i=
tem[VIRTIO_F_ISOLATE_INDIRECT_DESC(41)] This feature indicates that the=0A>=
 > +  device requires the driver to allocate each indirect descriptor on it=
s own=0A> > +  dedicated memory pages which MUST NOT hold any other data th=
an this indirect=0A> > +  descriptor.=0A>=20=0A> what are "memory pages"? t=
he spec does not define anything like this.=0A>=20=0A>=20=0A> > +=0A> > +  =
This allows the host to unmap these pages from the guest address space whil=
e=0A> > +  the indirect descriptors are available to the device. The device=
=0A> > +  implementation is therefore guaranteed that the driver cannot tam=
pered with an=0A> > +  indirect descriptor table while the device is using =
it.=0A>=20=0A> grammar issues in this text.=0A>=20=0A> > +=0A> > +  This me=
chanism notably allows to implement a memory isolation scheme where the=0A>=
 > +  virtio buffers are shared dynamically between the host and the guest =
as they=0A> > +  are exchanged through the virtqueues. It permits the host =
to share indirect=0A> > +  descriptor tables and all the associated buffers=
 as is, without the need for=0A> > +  the device to verify that the buffers=
 referenced in an indirect descriptor=0A> > +  table are actually accessibl=
e to the device.=0A>=20=0A> It's not really clear from this text what this =
verification is and how=0A> device can access without verifying it's access=
ible.  Generally we talk=0A> about device and driver.  Some examples talk a=
bout host and guest=0A> instead.  But here we have host, guest and device. =
This is not clear=0A> without much more explanation.=0A>=20=0A=0AFair enoug=
h. I agree this could be presented in more details. However this=0Abrings u=
p a question: do you think that the specification should describe this=0Asp=
ecific application of this feature bit?=0A=0AThe spec should define what th=
e feature bit implies, how it can be used is=0Aanother topic. I can certain=
ly provide more details on how we used it but there=0Amay be other applicat=
ions.=0A=0AWhat do you think?=0A=0A> > +=0A> >  \end{description}=0A> >=20=
=0A> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature =
Bits}=0A> > @@ -6980,6 +6997,12 @@ \chapter{Reserved Feature Bits}\label{se=
c:Reserved Feature Bits}=0A> >=20=0A> >  A driver SHOULD accept VIRTIO_F_NO=
TIF_CONFIG_DATA if it is offered.=0A> >=20=0A> > +A driver SHOULD accept VI=
RTIO_F_ISOLATE_INDIRECT_DESC if it is offered. If=0A> > +VIRTIO_F_ISOLATE_I=
NDIRECT_DESC has been negotiated, a driver MUST NOT access the=0A> > +memor=
y pages that contain an indirect descriptor after the indirect descriptor=
=0A> > +has been made available to the device and before it is returned as =
used,=0A> > +otherwise the resulting behavior is undefined.=0A>=20=0A> What=
 size are "memory pages"? descriptors are not returned as used,=0A> buffers=
 are used, pls use consistent terminology.=0A>=20=0A> > +=0A> >  \devicenor=
mative{\section}{Reserved Feature Bits}{Reserved Feature Bits}=0A> >=20=0A>=
 >  A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate f=
urther=0A> > @@ -7009,6 +7032,9 @@ \chapter{Reserved Feature Bits}\label{se=
c:Reserved Feature Bits}=0A> >  and presents a PCI SR-IOV capability struct=
ure, otherwise=0A> >  it MUST NOT offer VIRTIO_F_SR_IOV.=0A> >=20=0A> > +A =
device MAY fail to operate further if VIRTIO_F_ISOLATE_INDIRECT_DESC is not=
=0A> > +accepted.=0A>=20=0A> what does this mean? fail how? reject FEATURES=
_OK? that's normal for any=0A> bit I guess.=0A>=0A=0AYes, rejecting FEATURE=
S_OK is probably the best option here. To be honest with=0Ayou, I simply re=
-used the wording used for some other feature bits like=0AVIRTIO_F_VERSION_=
1 or VIRTIO_F_ACCESS_PLATFORM.=0A=0AI thought that this was important to me=
ntion, because most of the feature bits=0Aare here to describe optional fea=
tures that the driver is free to use or=0Anot. Not accepting them should no=
t make the device unusable. Whereas this new=0Afeature bit is more like som=
e sort of requirement from the device on the driver.=0A=0AAt the same time,=
 I agree with you that the specification is already clear on=0Athe fact tha=
t the device may reject FEATURES_OK if it is not happy with the=0Asubset of=
 features selected by the driver. If you think this is not relevant, I=0Ado=
 not mind dropping it.=0A=0A>=20=0A> > +=0A> >  \section{Legacy Interface: =
Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: =
Reserved Feature Bits}=0A> >=20=0A> >  Transitional devices MAY offer the f=
ollowing:=0A> > --=0A> > 2.38.0=0A> >=0A> >=0A> > This publicly archived li=
st offers a means to provide input to the=0A> > OASIS Virtual I/O Device (V=
IRTIO) TC.=0A> >=0A> > In order to verify user consent to the Feedback Lice=
nse terms and=0A> > to minimize spam in the list archive, subscription is r=
equired=0A> > before posting.=0A> >=0A> > Subscribe: virtio-comment-subscri=
be@lists.oasis-open.org=0A> > Unsubscribe: virtio-comment-unsubscribe@lists=
.oasis-open.org=0A> > List help: virtio-comment-help@lists.oasis-open.org=
=0A> > List archive: https://lists.oasis-open.org/archives/virtio-comment/=
=0A> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licens=
e.pdf=0A> > List Guidelines: https://www.oasis-open.org/policies-guidelines=
/mailing-lists=0A> > Committee: https://www.oasis-open.org/committees/virti=
o/=0A> > Join OASIS: https://www.oasis-open.org/join/
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

