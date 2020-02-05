Return-Path: virtio-comment-return-1050-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6ECAE9860E4
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Feb 2020 09:32:51 +0000 (UTC)
Date: Wed, 5 Feb 2020 04:32:42 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <2095927751.5096893.1580895162284.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200203081229-mutt-send-email-mst@kernel.org>
References: <20200201100107.20281-1-yuri.benditovich@daynix.com> <20200203045508-mutt-send-email-mst@kernel.org> <926049155.4815995.1580735457487.JavaMail.zimbra@redhat.com> <20200203081229-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Define per-packet hash
 reporting feature
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

----- Original Message ----- 

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <ybendito@redhat.com>
> Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
> virtio-comment@lists.oasis-open.org
> Sent: Monday, February 3, 2020 3:20:56 PM
> Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Define per-packet hash
> reporting feature

> On Mon, Feb 03, 2020 at 08:10:57AM -0500, Yuri Benditovich wrote:
> > > > +\item The device uses \field{hash_key_data} of the
> > > > virtio_net_rss_config
> > > > structure.
> > > > +\end{itemize}
> > > > +See the definition of virtio_net_rss_config structure in
> > > > \ref{sec:Device
> > > > Types / Network Device / Device Operation / Control Virtqueue /
> > > > Receive-side scaling (RSS) / Setting RSS parameters}
> > > > +
> > > > +If the feature VIRTIO_NET_F_RSS was not negotiated, the device uses
> > > > internal configuration
> > > > +of enabled hash types and a key used for hash calculation.
> >
> > > I don't understand this last paragraph. Could you clarify?
> >
> > In order to calculate a hash the device shall have 2 things:
> > a key for hash calculation
> > a bitmask which hash types are enabled
> >
> > In case the device supportes RSS command (even with single queue), it can
> > take them from current RSS configuration.
> > If only VIRTIO_NET_F_HASH_REPORT is negotiated, the device uses internal
> > preset of both parameters.
> >
> > Do you suggest something different?

> Hmm control over key/mask would be nice to have.
> I guess we could add a command along the lines of:

> struct virtio_net_hash_config {
> le32 hash_types;
> le16 reserved[4];
> u8 hash_key_length;
> u8 hash_key_data[hash_key_length];
> };

> This needs some thought: we don't want to request that devices have
> double the machinery so the command should not be there if RSS is
> enabled ...

> Maybe the command is only valid if HASH is set but RSS is clear?

No problem.
To avoid further ping-pongs:
What is this reserved[4] needed for?
Please confirm:
- this is an additional command under VIRTIO_NET_CTRL_MQ
- should be supported when HASH_REPORT is negotiated, with or without MQ, not needed if RSS supported
- Initially all hashes are disabled

> --
> MST

> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.

> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.

> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

