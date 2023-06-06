Return-Path: <virtio-comment-return-6170-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1699CC77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:05:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C0AE94EE4
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:05:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45C0C98658A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:05:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 308B198657E; Tue,  6 Jun 2023 21:05:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C702986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 21:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -Rvlue6yN4qScbzcJHI9kg-1
Date: Tue, 6 Jun 2023 09:51:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230606135156.GE1958291@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-10-pizhenwei@bytedance.com>
 <20230531210255.GC1509630@fedora>
 <8c964d51-5868-2dc9-6bf0-d0f58a2eced1@bytedance.com>
 <20230605165718.GD1624556@fedora>
 <795e4787-867d-915a-7385-206a5ba37631@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V7A/4tYQCy0O74nc"
Content-Disposition: inline
In-Reply-To: <795e4787-867d-915a-7385-206a5ba37631@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [virtio-comment] Re: Re: Re: [PATCH v2 09/11] transport-fabrics:
 add TCP&RDMA binding

--V7A/4tYQCy0O74nc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 09:41:09AM +0800, zhenwei pi wrote:
> On 6/6/23 00:57, Stefan Hajnoczi wrote:
> > On Fri, Jun 02, 2023 at 05:07:14PM +0800, zhenwei pi wrote:
> > >=20
> > >=20
> > > On 6/1/23 05:02, Stefan Hajnoczi wrote:
> > > > On Thu, May 04, 2023 at 04:19:08PM +0800, zhenwei pi wrote:
> > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > > ---
> > > > >    transport-fabrics.tex | 9 +++++++++
> > > > >    1 file changed, 9 insertions(+)
> > > > >=20
> > > > > diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> > > > > index f563c3e..c47a744 100644
> > > > > --- a/transport-fabrics.tex
> > > > > +++ b/transport-fabrics.tex
> > > > > @@ -873,3 +873,12 @@ \subsubsection{Status Definition}\label{sec:=
Virtio Transport Options / Virtio Ov
> > > > >    #define VIRTIO_OF_EALREADY      114
> > > > >    #define VIRTIO_OF_EQUIRK        4096
> > > > >    \end{lstlisting}
> > > > > +
> > > > > +\subsection{Transport Binding}\label{sec:Virtio Transport Option=
s / Virtio Over Fabrics / Transport Binding}
> > > > > +\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio =
Over Fabrics / ransport Binding / TCP}
> > > > > +TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fab=
rics / Transmission Protocol / Commands Definition / Stream Transmission}
> > > > > +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / T=
ransmission Protocol / Commands Definition / Stream Transmission}.
> > > > > +
> > > > > +\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio=
 Over Fabrics / ransport Binding / RDMA}
> > > > > +RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fa=
brics / Transmission Protocol / Commands Definition / Keyed Transmission}
> > > > > +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / T=
ransmission Protocol / Commands Definition / Keyed Transmission}.
> > > >=20
> > > > What about VQN representation, default port numbers, etc? There sho=
uld
> > > > be enough information here so implementers can create compatible
> > > > implementations.
> > > >=20
> > >=20
> > > Already replied in '[PATCH v2 02/11] transport-fabrics: introduce Vir=
tio
> > > Qualified Name'.
> > >=20
> > > > Is there connection encryption support? It's hard to imagine runnin=
g a
> > > > plaintext Virtio Over Fabrics TCP connection in a production enviro=
nment
> > > > due to security concerns.
> > > >=20
> > > > Stefan
> > >=20
> > > As far as I can see, 1) an ACL mechanism could be used in the enginee=
ring
> > > implementation without any specification.(ex, a target only allows a
> > > specific IVQN). 2) authentication may be introduced in the future.
> > >=20
> > > Does the virtqueue buffers need encryption support?
> >=20
> > An ACL in the target is still susceptible to attacks on confidentiality
> > (spying on traffic) and integrity (spoofing, injecting, or corrupting
> > traffic).
> >=20
> > My view is that nowadays anything that goes over the network needs
> > Transport Layer Security (TLS) built in or something comparable unless
> > the use cases are clearly limited to scenarios where this is not
> > necessary. To me it seems like Virtio over Fabarics could be used in
> > scenarios where encryption is necessary (e.g. to protect user data being
> > sent over a network).
> >=20
> > NVMe-over-TCP supports TLS.
> >=20
> > Stefan
>=20
> Generally, LAN is considered to be secure, using TCP makes sense. TLS is
> needed for WAN.

This depends on the security policy of the organization. I don't know
what percentage of organizations trust internal networks, but I'm sure
there is a significant proportion of organizations nowadays where
deploying an unsecured network service is not allowed.

Also, Virtio Over Fabrics (TCP) will work over the internet and some
users may use it for that.

I think including optional TLS support from the beginning is necessary.

Stefan

--V7A/4tYQCy0O74nc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR/OfwACgkQnKSrs4Gr
c8j1qgf/XW7EP2xWB/o+VV9IbEhHelIjcOaXEo45qC46UGuFzahD96EK/omSn3ce
Fe7Knss7ao6PkZTWop+EpLJI8iaoDXDUp6fewRF49Gh8OuS+VUDzRKnfFFm91wdG
i4Q/a01guuqEU/nQFcGu8uKgDkbhImuU8oR62kD1TgmN7ZA7kXuM/i+gMY9bEz/v
6bE9R7R53Ex1RrqrhVBcus/hLyjxGA6TOuNBDzd1PK84y8djkk6oWtZbQ4Sk5TQZ
1fp/YQfXwdfE3VfbOlym6aRfri1Cf+WdBapikYhXRkfidcO1+q48LQSxDKXP2huo
ZxMj/eOhH3Ts+Zqd6tUzur70qZoZQg==
=YUq0
-----END PGP SIGNATURE-----

--V7A/4tYQCy0O74nc--

