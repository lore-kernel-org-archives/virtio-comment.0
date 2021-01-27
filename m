Return-Path: virtio-comment-return-1685-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76C8298656B
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Jan 2021 11:11:21 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:11:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210127121113.44be39f3.cohuck@redhat.com>
In-Reply-To: <57f28d37-9d93-9283-bf9c-5b4c487a99de@redhat.com>
References: <20210125110823.591104-1-cohuck@redhat.com>
	<57f28d37-9d93-9283-bf9c-5b4c487a99de@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v3] clarify device reset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 27 Jan 2021 11:07:53 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2021/1/25 =E4=B8=8B=E5=8D=887:08, Cornelia Huck wrote:
> > Properly specify that the method for the driver to request a
> > device reset is transport specific, and some action the device
> > has to take.
> >
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >
> > RFC v2 -> v3:
> >    - re-worded the "must not send notifications" clause to avoid guessi=
ng
> >    - added a driver conformance clause on how a driver should find out
> >      when reset is complete
> > RFC -> RFC v2:
> >    - moved reset spec to basic facilities
> >
> > ---
> >   conformance.tex |  2 ++
> >   content.tex     | 19 +++++++++++++++++++
> >   2 files changed, 21 insertions(+)
> >
> > diff --git a/conformance.tex b/conformance.tex
> > index eb3324053080..21fe89ccd937 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -60,6 +60,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
> >   \begin{itemize}
> >   \item \ref{drivernormative:Basic Facilities of a Virtio Device / Devi=
ce Status Field}
> >   \item \ref{drivernormative:Basic Facilities of a Virtio Device / Feat=
ure Bits}
> > +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Devic=
e Reset}
> >   \item \ref{drivernormative:Basic Facilities of a Virtio Device / Devi=
ce Configuration Space}
> >   \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virt=
queues}
> >   \item \ref{drivernormative:Basic Facilities of a Virtio Device / Mess=
age Framing}
> > @@ -271,6 +272,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> >   \begin{itemize}
> >   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Devi=
ce Status Field}
> >   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feat=
ure Bits}
> > +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Devic=
e Reset}
> >   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Devi=
ce Configuration Space}
> >   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Mess=
age Framing}
> >   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virt=
queues / The Virtqueue Descriptor Table}
> > diff --git a/content.tex b/content.tex
> > index 620c0e28c9a7..9cdefe16509e 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -193,6 +193,25 @@ \section{Notifications}\label{sec:Basic Facilities=
 of a Virtio Device
> >   terminology. Occasionally, the term event is used to refer to
> >   a notification or a receipt of a notification.
> >  =20
> > +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device /=
 Device Reset}
> > +
> > +The driver may initiate a device reset at various times; notably, duri=
ng
> > +device initialization and device cleanup.
> > +
> > +The mechanism used by the driver to initiate the reset is transport sp=
ecific.
> > +
> > +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Virt=
io Device / Device Reset}
> > +
> > +A device MUST reinitialize device status to 0 after receiving a reset.
> > + =20
>=20
>=20
> We had similar description in "2.1.2 Device Requirements: Device Status=
=20
> Field":
>=20
> "The device MUST initialize device status to 0 upon reset."
>=20
> Consider we had a dedicated part for reset, maybe we can remove that one.

Maybe we can replace the normative statement with an informal
description in the device status section? I.e. something like

"The device status field starts out as 0, and is reinitialized to 0 by
the device during reset."

>=20
> Thanks
>=20
>=20
> > +A device MUST NOT send notifications after indicating completion of
> > +the reset by reinitializing the device status to 0.
> > +
> > +\drivernormative{\subsection}{Device Reset}{Basic Facilities of a Virt=
io Device / Device Reset}
> > +
> > +The driver SHOULD consider a driver-initiated reset complete when it
> > +reads the device status as 0.
> > +
> >   \section{Device Configuration Space}\label{sec:Basic Facilities of a =
Virtio Device / Device Configuration Space}
> >  =20
> >   Device configuration space is generally used for rarely-changing or =
=20


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

