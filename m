Return-Path: <virtio-comment-return-5464-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D9C77B76
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 21:43:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9D5212B06A
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 21:43:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8951C986615
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 21:43:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 759E6986197; Thu, 13 Apr 2023 21:43:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 633D0986601
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Apr 2023 21:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3PfzJcpOOpK9t2d_OvCehg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681422223; x=1684014223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Tc2PCm+pxR9ftdoKs6wXfiMIfxu7ofI+J5rXyxQj7I=;
        b=FCqjLQtNxSYS2vHXpvRDBKK0CSIw4GCP0qf7yMpoKTi13QAIDklIGM3SM+t79bq4Cl
         ZmIH4bcCUfhFgUiNF1Teke1GvEJMSFgGBEqZNuK8BQlinjCBdhapz355UGa64UzFaOF8
         ftA5dfq5g+x6IgnnkJpZqC93xS3ZY4+38B0cPPU+XIl1wtMktAXEqKtIJj5Tjpr/qZdM
         QFYrHvDsUmr5PRETunACLH802xr2sI03Mf033RFMfR2aapUFFB+P3InkcsBoB39zFIbG
         aoMmsmUALlFULiEfYqo31XtnAMcLs8XAZsfJmNzqWejfK5usL5Zbsfs53zxf2APCyEjh
         RzZQ==
X-Gm-Message-State: AAQBX9dJfMNmPzBy6aZK0wF3OFmJEV54H9pHtRydvIqVB3M//JX7UVKr
	h5wAe36IKU0VAMQ3zBc6F8ADZAoM5kT/6fkstCc/vaizNxCUPX1BSgVhJ/lFcbR1B+DLxUXY3PZ
	bKV/lZE06byzT0+Oyomz+8lracdICqbMHMA==
X-Received: by 2002:a5d:45c3:0:b0:2f5:5d74:4f9f with SMTP id b3-20020a5d45c3000000b002f55d744f9fmr2558770wrs.11.1681422223697;
        Thu, 13 Apr 2023 14:43:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350YJzrxpbiL7uj6Hb42h4Q9xKPKoNO1teM2JCgIG5EBGzyu7gjFOYU+7TLEhvzRc8QilA6x9kw==
X-Received: by 2002:a5d:45c3:0:b0:2f5:5d74:4f9f with SMTP id b3-20020a5d45c3000000b002f55d744f9fmr2558757wrs.11.1681422223213;
        Thu, 13 Apr 2023 14:43:43 -0700 (PDT)
Date: Thu, 13 Apr 2023 17:43:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230413173127-mutt-send-email-mst@kernel.org>
References: <20230403045833.21853-1-hengqi@linux.alibaba.com>
 <1d30d4a0-6bfc-3d58-17a4-645602d3792f@redhat.com>
 <a95ca379-0675-9b33-f649-bd2a19b56190@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <a95ca379-0675-9b33-f649-bd2a19b56190@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v12] virtio-net: support inner
 header hash

On Thu, Apr 13, 2023 at 07:03:26PM +0800, Heng Qi wrote:
> > >   For example, when the packets of certain
> > > +tunnels are spread across multiple receive queues, these receive
> > > queues may have an unbalanced
> > > +amount of packets. This can cause a specific receive queue to
> > > become full, resulting in packet loss.
> > 
> > 
> > We have many places that can lead to packet dropping. For example, the
> > automatic steering is best effort. I tend to avoid mentioning things
> > like this.
> 
> Ok. And Michael what do you think about this?


I think this text did not do a great job explaining the
security aspect. Here's a better, shorter explanation:

	It is often an expectation of users that a tunnel isolates the external
	network from the internal one. By completely ignoring entropy in the
	external header and replacing it with entropy from the internal header,
	for hash calculations, this expectation might be violated to a certain
	extent, depending on how the hash is used. When the hash use is limited
	to RSS queue selection, the effect will likely be limited to ability of
	users inside the tunnel to cause packet drops in multiple queues (as
	opposed to a single queue without the feature).

> > 
> > 
> > > +
> > > +Possible mitigations:
> > > +\begin{itemize}
> > > +\item Use a tool with good forwarding performance to keep the
> > > receive queue from filling up.
> > > +\item If the QoS is unavailable, the driver can set
> > > \field{hash_tunnel_types} to VIRTIO_NET_HASH_TUNNEL_TYPE_NONE
> > > +      to disable inner header hash for encapsulated packets.
> > > +\item Choose a hash key that can avoid queue collisions.
> > > +\item Perform appropriate QoS before packets consume the receive
> > > buffers of the receive queues.
> > > +\end{itemize}
> > > +
> > > +The limitations mentioned above exist with/without the inner header
> > > hash.
> > 
> > 
> > This conflicts with the tile "Tunnel QoS limitation" which readers may
> > think it happens only for tunnel.
> 
> Perhaps a "QoS Advices" is better?

Plural of "advice" is "advice" not "advices".

This advice is somewhat bogus though.

The point I keep trying to make is that this:

	Choose a hash key that can avoid queue collisions.

is impossible with the feature and possible without.
This was the whole reason I asked for a security
considerations sections.


> Thanks!
> 
> > 
> > Thanks
> > 
> > 
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> > 
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> > 
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/


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

