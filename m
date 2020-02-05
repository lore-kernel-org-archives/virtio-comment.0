Return-Path: virtio-comment-return-1051-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69AF99860E4
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Feb 2020 10:31:15 +0000 (UTC)
Date: Wed, 5 Feb 2020 05:30:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200205052829-mutt-send-email-mst@kernel.org>
References: <20200201100107.20281-1-yuri.benditovich@daynix.com>
 <20200203045508-mutt-send-email-mst@kernel.org>
 <926049155.4815995.1580735457487.JavaMail.zimbra@redhat.com>
 <20200203081229-mutt-send-email-mst@kernel.org>
 <2095927751.5096893.1580895162284.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2095927751.5096893.1580895162284.JavaMail.zimbra@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Define per-packet hash
 reporting feature
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <ybendito@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Feb 05, 2020 at 04:32:42AM -0500, Yuri Benditovich wrote:
> ----- Original Message -----=20
>=20
> > From: "Michael S. Tsirkin" <mst@redhat.com>
> > To: "Yuri Benditovich" <ybendito@redhat.com>
> > Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
> > virtio-comment@lists.oasis-open.org
> > Sent: Monday, February 3, 2020 3:20:56 PM
> > Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Define per-packet =
hash
> > reporting feature
>=20
> > On Mon, Feb 03, 2020 at 08:10:57AM -0500, Yuri Benditovich wrote:
> > > > > +\item The device uses \field{hash_key_data} of the
> > > > > virtio_net_rss_config
> > > > > structure.
> > > > > +\end{itemize}
> > > > > +See the definition of virtio_net_rss_config structure in
> > > > > \ref{sec:Device
> > > > > Types / Network Device / Device Operation / Control Virtqueue /
> > > > > Receive-side scaling (RSS) / Setting RSS parameters}
> > > > > +
> > > > > +If the feature VIRTIO_NET_F_RSS was not negotiated, the device u=
ses
> > > > > internal configuration
> > > > > +of enabled hash types and a key used for hash calculation.
> > >
> > > > I don't understand this last paragraph. Could you clarify?
> > >
> > > In order to calculate a hash the device shall have 2 things:
> > > a key for hash calculation
> > > a bitmask which hash types are enabled
> > >
> > > In case the device supportes RSS command (even with single queue), it=
 can
> > > take them from current RSS configuration.
> > > If only VIRTIO_NET_F_HASH_REPORT is negotiated, the device uses inter=
nal
> > > preset of both parameters.
> > >
> > > Do you suggest something different?
>=20
> > Hmm control over key/mask would be nice to have.
> > I guess we could add a command along the lines of:
>=20
> > struct virtio_net_hash_config {
> > le32 hash_types;
> > le16 reserved[4];
> > u8 hash_key_length;
> > u8 hash_key_data[hash_key_length];
> > };
>=20
> > This needs some thought: we don't want to request that devices have
> > double the machinery so the command should not be there if RSS is
> > enabled ...
>=20
> > Maybe the command is only valid if HASH is set but RSS is clear?
>=20
> No problem.
> To avoid further ping-pongs:
> What is this reserved[4] needed for?

It makes the layout match the RSS config command exactly, so
we don't need to duplicate code.
In fact we can instead just say that this command
uses the same structure, with rss fields are zeroed out.

> Please confirm:
> - this is an additional command under VIRTIO_NET_CTRL_MQ
> - should be supported when HASH_REPORT is negotiated, with or without MQ,=
 not needed if RSS supported
> - Initially all hashes are disabled

This is what I would do, yes.

> > --
> > MST
>=20
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
>=20
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/


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

