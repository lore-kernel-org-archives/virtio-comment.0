Return-Path: <virtio-comment-return-5996-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3EEC77B73
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 19:10:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 10557FD568
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 19:10:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B4B2986408
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 19:10:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0264E9863C0; Mon, 22 May 2023 19:10:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E48489863C7
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 May 2023 19:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OvY5JNKLMAO6klTFjCd10w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684782610; x=1687374610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEsK6H+8XVVop6J2XP9y8pIMo6YCycGfR8NuHd7bNbw=;
        b=SevfpqLHQtGwwUnkL280RcPePdi40sxODPeRWqCtYvlnYdg+UbHANgjkhuwHhAT6B2
         +E3fv07yP64svXG6XlMXq8ox9wY5+v8J6GPaIEAzIGjLtP8wFH0tp8d6zkeV30ZcIi4z
         bRhlaQfOUjEu/PPKCqgPr1RZyj9AwQn9+h8/rGB1WluDy44yAN/VZhv0TyMjvgXTWtyD
         6PMtmrjXwEGcjhmEuBC7Z6Yi9rcPqSXSQlqrQFyMaN2H0O/EnVO5ZO8960OP7gYfps4p
         1xCvnioapnKFFVwLnGWY675AR0idGuTgRK9rgP7MV5RxhjCfqNhLYtVQ+nnK8G1IHTNT
         wB+Q==
X-Gm-Message-State: AC+VfDwDmaYE6kPjE1PbZ9Cls4gpWglcxh7b7LOrk6NbW8yP+Mg9XAIB
	zGUKAks+0Cl0Nu5m5Ituc60lW8BvqnLjcpE6hDYVLfYrff47mqrgFpt+RjwzRUzVJEC3EgdjASb
	fur3wxHI+R4IfDazJTXeQ9J3L0B4bsrdMLg==
X-Received: by 2002:a1c:cc02:0:b0:3f4:fc5e:fbf2 with SMTP id h2-20020a1ccc02000000b003f4fc5efbf2mr8574801wmb.8.1684782610119;
        Mon, 22 May 2023 12:10:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67mEqYkulKuw1eqjexi0VF9E/tVrotqpOoYZIiJ55JoDw8IJJA1HKQmT5Wl1WnMNyNS+ibkw==
X-Received: by 2002:a1c:cc02:0:b0:3f4:fc5e:fbf2 with SMTP id h2-20020a1ccc02000000b003f4fc5efbf2mr8574781wmb.8.1684782609758;
        Mon, 22 May 2023 12:10:09 -0700 (PDT)
Date: Mon, 22 May 2023 15:10:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230522150743-mutt-send-email-mst@kernel.org>
References: <20230522121200.40939-1-hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20230522121200.40939-1-hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [Proposal] Relationship between XDP and rx-csum in virtio-net

On Mon, May 22, 2023 at 08:12:00PM +0800, Heng Qi wrote:
> 1) Add a feature bit to the virtio specification to tell the sender that a fully
> csumed packet must be sent.

Who is the sender in this picture? The driver?

-- 
MST


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

