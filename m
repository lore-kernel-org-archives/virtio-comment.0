Return-Path: <virtio-comment-return-5200-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82BEC7618D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 06:35:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 60ABB330A9
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 06:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 154479863FE
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 06:35:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0CF2E9863ED; Tue,  4 Apr 2023 06:35:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0AEB9863E6
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 06:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VbBCMLiwOUeK0d6DkDBPVg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680590100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teeyyh88qs0OBOxku3WhOOqNN/Ql3FGS6DfMKEgucUE=;
        b=eBFPlo1h1kXtBEc+gn1XYtT1S8yA8lTeY2TnSEaOSszt9BJpfTFYxr44K5bYeSCzOp
         BM/dzmtFuwhlfTN817OzU7Si5UHi9An/POlHM3Scyc/gb6dddImkmyj6R8rCBBsTR4RV
         H7XiX1wAo+w0Mfjj56VBmzleucBkVYy2ZB71uS2cHAC76vccERdt2Sir7wUNWpVXNd7n
         YE0Cp2H0wCiPhA5/Cyyl8krccCf+FlbDVvj8c70kL3IrHIWRvAAPdwjZxr9yEDagbtip
         9OXC0JTfpk3tlb3nTEPTXNl91bxbLzm5VoTM2f1w634kvPQeAxIta5FIONX1PTawE9/s
         CLwQ==
X-Gm-Message-State: AAQBX9cOvUtBhS32VIkl1pt9i6BD6ia3/NaiAJlwH2iCqxyHSqO4sEzV
	WhCWyyfLjY0xyNnaBi8GmCHsEcmJJNQsDUzZPIe8p+hV6/j2HgNRgRyYr3jeoGuV6PLOW1D3XCA
	S9NYqwiTtNh9gRjenRopH/jRcpLQLQ0ULCQ==
X-Received: by 2002:aa7:cf8d:0:b0:4bc:f925:5dbe with SMTP id z13-20020aa7cf8d000000b004bcf9255dbemr1328065edx.42.1680590100341;
        Mon, 03 Apr 2023 23:35:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350YTV01zSr1Qu9rYam3tnZzaSpnnTxAH+LRp3Mk8JPEb480bt/vC7ma+zc7wmXxN6/zhTgRJvw==
X-Received: by 2002:aa7:cf8d:0:b0:4bc:f925:5dbe with SMTP id z13-20020aa7cf8d000000b004bcf9255dbemr1328049edx.42.1680590099993;
        Mon, 03 Apr 2023 23:34:59 -0700 (PDT)
Date: Tue, 4 Apr 2023 02:34:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Parav Pandit <parav@nvidia.com>,
	virtio-dev@lists.oasis-open.org, sgarzare@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230404023334-mutt-send-email-mst@kernel.org>
References: <20230329212341.465843-1-parav@nvidia.com>
 <20230330191114.77acd860.pasic@linux.ibm.com>
 <87jzyxcp8g.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87jzyxcp8g.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v10 0/8] Rename queue index to queue number

On Fri, Mar 31, 2023 at 10:13:51AM +0200, Cornelia Huck wrote:
> On Thu, Mar 30 2023, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Thu, 30 Mar 2023 00:23:33 +0300
> > Parav Pandit <parav@nvidia.com> wrote:
> >
> >> 1. Currently, virtqueue is identified between driver and device
> >> interchangeably using either number or index terminology.
> >> 
> >> 2. Between PCI and MMIO transport the queue size (depth) is
> >> defined as queue_size and QueueNum respectively.
> >> 
> >> To avoid confusion and to have consistency, unify them to use Number.
> >> 
> >> Solution:
> >> a. Use virtqueue number description, and rename MMIO register as QueueSize.
> >
> > I'm in favor of replacing number with size where appropriate.
> >
> >> b. Replace virtqueue index with virtqueue number
> >
> > I don't see the benefit of replacing virtqueue index with virtqueue
> > number.
> >
> > Currently virtqueue number is only used in the parts that describe
> > notifications (Guest->Host), the rest of the spec uses virtqueue index.
> >
> > I argue that using a different term in that context than in the rest
> > of the specification makes sense, because in the context of notifications
> > the virtqueue isn't always identified by its index.
> >
> > More precisely: if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated in the
> > context of notifications the virtqueue is identified by the
> > so called "queue_notify_data"; if VIRTIO_F_NOTIF_CONFIG_DATA has been
> > negotiated in the context of notifications the virtqueue is identified by
> > the virtqueue index (as usual, for example in queue_select, or in
> > the ccws).
> >
> > As I've pointed out in my comment to patch 2, I believe replacing
> > virtqueue index with virtqueue number is detrimental to clarity.
> >
> > Thus please find a counter-proposal below. If there is interest
> > I can make a series out of it, and prettify it. If I can't convince
> > you guys, then I will have to get used to vqn and virtqueue number.
> 
> I would generally prefer "index" as well, but there seemed to be a
> strong sentiment that we should go with "number"... so, what *is* the
> actual general sentiment? It's hard to say, but maybe most people are
> fine with either?

If we really can't decide one way or another then I can run a ballot,
it's not hard.


> >
> > AFAIR the other problem with index was the RSS for virtio-net. But there
> > we are currently heading down a direction of introducing a new
> > abstraction. This approach avoids confusion around the term 'virtqueue
> > index' as much as it avoids confusion around the term 'virtqueue nuber'.
> >
> >
> >> c. RSS area of virtio net has inherited some logic, describe it
> >> using abstract rss_rq_id.
> >
> > -------------------------8<--------------------------------------
> > From: Halil Pasic <pasic@linux.ibm.com>
> > Date: Thu, 30 Mar 2023 17:57:53 +0200
> > Subject: [PATCH 1/1] content: clarify how virtques are identified
> >
> > Clarify how virtqueues are identified in the context of
> > available notifications and in the context of RSS for
> > virtio-net .
> >
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > ---
> >  content.tex                      | 15 ++++++++++-----
> >  device-types/net/description.tex | 30 ++++++++++++++++++++++--------
> >  transport-ccw.tex                |  2 +-
> >  transport-pci.tex                |  7 ++++---
> >  4 files changed, 37 insertions(+), 17 deletions(-)
> 
> (...)
> 
> > +struct rss_rq_id {
> > +   le16 value; /* virtqueue index divided by two */
> > +};
> > +
> >  struct virtio_net_rss_config {
> >      le32 hash_types;
> >      le16 indirection_table_mask;
> > -    le16 unclassified_queue;
> > -    le16 indirection_table[indirection_table_length];
> > +    struct rss_rq_id unclassified_queue;
> > +    struct rss_rq_id indirection_table[indirection_table_length];
> >      le16 max_tx_vq;
> >      u8 hash_key_length;
> >      u8 hash_key_data[hash_key_length];
> >  };
> >  \end{lstlisting}
> > +
> > +The type struct rss\_rq\_id is introduced to better distinguish receive queue
> > +ids form other integral fields.
> > +
> > +A receive queue id is only defined for receive queues, as the virtqueue index
> > +of the receive virtqueue divided by two (the virtqueue index of a receive
> > +queue is always even). For example receiveq4 is identified by the virtqueue
> > +index 6 and the receive queue id 3.
> 
> FWIW, I think this is much easier to understand.


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

