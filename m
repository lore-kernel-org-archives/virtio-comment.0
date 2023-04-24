Return-Path: <virtio-comment-return-5590-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A470C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:54:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4B803330A3
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:54:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39B84986635
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:54:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2C1E59863E1; Mon, 24 Apr 2023 15:54:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1BCEB986385
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 15:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: I9rDQE1yPkCPkybkUlK6sQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682351653; x=1684943653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw0q+yjBrrJ0HHXQJhvUcTYRS5Zt9SKI9OLkAQu5Zfc=;
        b=g2xLIaU9R72q+ZKmqV5X5GCUrXDS6TNuAQwCf5tQd8xKjxCFwHSFEntYzCxGcCf8aZ
         n5JoMi8ZN6WdNz+5gfPE/p8mv4t4GrJuWKqWD8zxqSglvFW5ArtC3BZqsNM0HgrRRE7L
         NdK/FvYngM1doi8s7nhtB4DzmWAgy5SohoBsuTqhuV3oIsfK1EB8GdCoKNdzDHba6VAA
         U8LYZqWZlF4EYBrKO7jUYOE0UZNEF4o7vU4hkg/tFY1uHYIBt7Us5Udumy/H4+bm/a9g
         KswySGyyNNPZzifSqTRMEnc5OafT3lfW/tBxo7Fho7ZRSS6rgyi1TryKowYoKzuxKWL0
         aqLQ==
X-Gm-Message-State: AAQBX9cq47u9aCeVZEOLzd24dozriQa936aoLMW2FVgUrvAXYXc8tdDB
	faIlfYt9qK6XCsKqbJuKZRe58bHHN8S7ax3upbvaZ60FdlBmm+pQLlO6E1HKox5h0GDuILIBtLu
	gEMpjKsFvOOLpbRursIG33/8HkMMeKdvbow==
X-Received: by 2002:adf:dd85:0:b0:2f9:a798:602c with SMTP id x5-20020adfdd85000000b002f9a798602cmr10101168wrl.12.1682351653401;
        Mon, 24 Apr 2023 08:54:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350bskjSgFi8JPTAoKyofvBzcwCPeNx+Ds13BoDmatciSF/hz7g4V3JO7oIoxBpkyFahUnzn96A==
X-Received: by 2002:adf:dd85:0:b0:2f9:a798:602c with SMTP id x5-20020adfdd85000000b002f9a798602cmr10101153wrl.12.1682351653069;
        Mon, 24 Apr 2023 08:54:13 -0700 (PDT)
Date: Mon, 24 Apr 2023 11:54:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230424114849-mutt-send-email-mst@kernel.org>
References: <20230419014639.919458-1-parav@nvidia.com>
 <20230419014639.919458-11-parav@nvidia.com>
 <20230424152221.54c44489.pasic@linux.ibm.com>
 <20230424094202-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818907C4A9BF2031664166DC679@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818907C4A9BF2031664166DC679@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v14 10/11] virtio-net: Describe RSS using rss rq id

On Mon, Apr 24, 2023 at 03:30:33PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, April 24, 2023 9:59 AM
> 
> > > >  Driver sends a VIRTIO_NET_CTRL_MQ_RSS_CONFIG command
> > 
> > maybe add:
> > 	including virtqueue index of relevant receive queues
> > 
> Structure struct virtio_net_rss_config has many fields for RSS_CONFIG command.
> It is not much help to say including receive queues, including indirection table etc.
> The structure is evident and all those fields are described in the struct including the receive virtqueue.

ok

> 
> > > >  struct virtio_net_rss_config {
> > > >      le32 hash_types;
> > > >      le16 indirection_table_mask;
> > > > -    le16 unclassified_queue;
> > > > -    le16 indirection_table[indirection_table_length];
> > > > +    struct rss_rq_id unclassified_queue;
> > > > +    struct rss_rq_id indirection_table[indirection_table_length];
> > > >      le16 max_tx_vq;
> > > >      u8 hash_key_length;
> > > >      u8 hash_key_data[hash_key_length]; @@ -1453,10 +1458,15 @@
> > > > \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > > > Device / Devi  \field{indirection_table} array.
> > > >  Number of entries in \field{indirection_table} is
> > (\field{indirection_table_mask} + 1).
> > > >
> > > > -Field \field{unclassified_queue} contains the 0-based index of -the
> > > > receive virtqueue to place unclassified packets in. Index 0 corresponds to
> > receiveq1.
> > > > +\field{rss_rq_id} is a receive virtqueue id. \field{vq_index_1_16}
> > > > +consists of bits 1 to 16 of a virtqueue index. For example, a
> > > > +\field{vq_index_1_16} value of 3 corresponds to virtqueue index 6,
> > > > +which maps to receiveq4.
> > > > +
> > > > +Field \field{unclassified_queue} contains the receive virtqueue in
> > > > +which to place unclassified packets.
> > >
> > > It does not contain a receive virtqueue but its \field{rss_rq_id},
> > > i.e. it's "receive virtqueue id".
> > 
> receive virtqueue != virtqueue index.
> The receive virtqueue is description. The structure rss_rq_id is clear enough to indicate that how an receive virtqueue is communicated with the device.

the text originally was pretty clear though, the only problem
was format of index was unclear. your change me and Halil
both feel obscured things.

> > Yes all this last chunk is not an improvement.
> > My whole point was that we do not need a name for this thing that is struct
> > rss_rq_id. It's just a weird way to store a vq index.
> > 
> > Also \field{rss_rq_id} is confusing since it's actually \field{struct rss_rq_id}. We
> > are using C-like not C++ like syntax ;)
> > 
> > One way to address all this:
> > 
> > \field{struct rss_rq_id} contains a virtqueue index: \field{vq_index_1_16}
> > consists of bits 1 to 16 of a virtqueue index. For example, a
> > \field{vq_index_1_16} value of 3 corresponds to virtqueue index 6, which maps
> > to receiveq4.
> > 
> > Field \field{unclassified_queue} contains the virtqueue index of the receive
> > virtqueue to place unclassified packets in, in \field{struct rss_rq_id} format.
> > 
> The data type of the unclassified_queue is struct rss_rq id, so we don't need to emphasis it again.

oh, you can drop that:
	\field{struct rss_rq_id} contains a virtqueue index: \field{vq_index_1_16}
	consists of bits 1 to 16 of a virtqueue index. For example, a
	\field{vq_index_1_16} value of 3 corresponds to virtqueue index 6, which maps
	to receiveq4.
	 
	Field \field{unclassified_queue} contains the virtqueue index of the receive
	virtqueue to place unclassified packets in.

but in any case, there is no point in saying "\field{rss_rq_id} is a
receive virtqueue id." This concept of "receive virtqueue id"
is not really useful.



> For example, we don't say, max_tx_vq is in le16 format.
> 
> I am going to keep the current version as it is better than then extra verbosity.

Maybe "specifies" instead of "contains" then?

+Field \field{unclassified_queue} specifies the receive virtqueue in
+which to place unclassified packets.



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

