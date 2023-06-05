Return-Path: <virtio-comment-return-6140-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C1BC7EE24
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 16:57:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 12EDD44543
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 16:57:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFFE298645C
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 16:57:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DFA9F986449; Mon,  5 Jun 2023 16:57:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CCD8198644A
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Q8Z4XS_YMuK0IorBHB4GGg-1
Date: Mon, 5 Jun 2023 12:57:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230605165718.GD1624556@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-10-pizhenwei@bytedance.com>
 <20230531210255.GC1509630@fedora>
 <8c964d51-5868-2dc9-6bf0-d0f58a2eced1@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="weVhIUFells4ziM4"
Content-Disposition: inline
In-Reply-To: <8c964d51-5868-2dc9-6bf0-d0f58a2eced1@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [virtio-comment] Re: Re: [PATCH v2 09/11] transport-fabrics: add TCP&RDMA binding

--weVhIUFells4ziM4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 05:07:14PM +0800, zhenwei pi wrote:
>=20
>=20
> On 6/1/23 05:02, Stefan Hajnoczi wrote:
> > On Thu, May 04, 2023 at 04:19:08PM +0800, zhenwei pi wrote:
> > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > ---
> > >   transport-fabrics.tex | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> > > index f563c3e..c47a744 100644
> > > --- a/transport-fabrics.tex
> > > +++ b/transport-fabrics.tex
> > > @@ -873,3 +873,12 @@ \subsubsection{Status Definition}\label{sec:Virt=
io Transport Options / Virtio Ov
> > >   #define VIRTIO_OF_EALREADY      114
> > >   #define VIRTIO_OF_EQUIRK        4096
> > >   \end{lstlisting}
> > > +
> > > +\subsection{Transport Binding}\label{sec:Virtio Transport Options / =
Virtio Over Fabrics / Transport Binding}
> > > +\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over=
 Fabrics / ransport Binding / TCP}
> > > +TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics=
 / Transmission Protocol / Commands Definition / Stream Transmission}
> > > +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Trans=
mission Protocol / Commands Definition / Stream Transmission}.
> > > +
> > > +\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Ove=
r Fabrics / ransport Binding / RDMA}
> > > +RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabric=
s / Transmission Protocol / Commands Definition / Keyed Transmission}
> > > +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Trans=
mission Protocol / Commands Definition / Keyed Transmission}.
> >=20
> > What about VQN representation, default port numbers, etc? There should
> > be enough information here so implementers can create compatible
> > implementations.
> >=20
>=20
> Already replied in '[PATCH v2 02/11] transport-fabrics: introduce Virtio
> Qualified Name'.
>=20
> > Is there connection encryption support? It's hard to imagine running a
> > plaintext Virtio Over Fabrics TCP connection in a production environment
> > due to security concerns.
> >=20
> > Stefan
>=20
> As far as I can see, 1) an ACL mechanism could be used in the engineering
> implementation without any specification.(ex, a target only allows a
> specific IVQN). 2) authentication may be introduced in the future.
>=20
> Does the virtqueue buffers need encryption support?

An ACL in the target is still susceptible to attacks on confidentiality
(spying on traffic) and integrity (spoofing, injecting, or corrupting
traffic).

My view is that nowadays anything that goes over the network needs
Transport Layer Security (TLS) built in or something comparable unless
the use cases are clearly limited to scenarios where this is not
necessary. To me it seems like Virtio over Fabarics could be used in
scenarios where encryption is necessary (e.g. to protect user data being
sent over a network).

NVMe-over-TCP supports TLS.

Stefan

--weVhIUFells4ziM4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR+E+4ACgkQnKSrs4Gr
c8iRnggAsIk5VK3co2sN+xm2UNdO8zOn8KWySQMrKFWuvdyuJBOdItLKHlletHNe
w1120iUmBNYL2INmrV1Ef06mRVSXkgcI/PS2HMmmP6WmlZdb0MFTk9P8XoozVdoA
0isDVPRhkYBHaBQg3dmGRu1zxhZOfqHbVwdZbYV5X+1ZEEeJXZ3jVrFe5Ak7qUTb
q/ADl1upvux7X/3ICOE9auk4amujBfm9FxEapiCDBUWZOfuAzg1ZWHecZVWoE1CB
lQ9CJuwukv+GXl5LvsFRSfZasfPGg6i1yejHVAVZymIzldURWWtFmYoy1qe4PXMQ
UDnljLesDkLdHt4sSinwZebQwif+OA==
=QMws
-----END PGP SIGNATURE-----

--weVhIUFells4ziM4--

