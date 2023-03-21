Return-Path: <virtio-comment-return-4941-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DDAC74A5B
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 09:31:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CD13E120D51
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 09:31:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8FDA986486
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 09:31:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BFC6D98643E; Tue, 21 Mar 2023 09:31:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFC9298644E
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 09:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dFBvSR_eP-aTrrYxaHKBeA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679391079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzIbcr02G+W33S0WHGH17YzYkpk0gSkaDy9iXkeytME=;
        b=2G5nJ1lITrqn2GOOUBBhlmDYW8YPvLYcFhQ6c/6wPsGc30xXqzGxSWEKU7BuedqZgx
         yqgaiKqpsUusuXxkAlAk2NNsNKxGCzQl94thgW6IGuo/+J49lzBfI1GuS0+x3Z3ho8hJ
         i+blRKHQZkv0xC06xgUTBitx/rekXQeN+YKEjHaiubejcIgvEdpey8hj/bf5985nxzR0
         NrCVSBrAXZZ7gH/5BrMySmQPgSXqjnUk/UIAJVCh6F6TpzUuKzIs8BqsVDLuBGhYRbCc
         V67KDcHOAJjx7Nw16ioIgRHwdqUCCuWZNa76PTCTOTORZ8st3dcNLHz1OIalJxZleufN
         K27w==
X-Gm-Message-State: AO0yUKVQ2rFURmTgQHGITbrh4RxjvjahdEFfEbWD+tqC0bJ3A8nIjjja
	6qisMYRUDCBj7Ovdk2wQLeWZZS+sNNmlvl/6K6Ofg7xyzv/a7PyHWrJpxKudv3Y/VhuJzfHe3R3
	tiL/l20DGXXe74lsSyDzWhRoJttgn2ok8pw==
X-Received: by 2002:a05:600c:3794:b0:3eb:3947:41ea with SMTP id o20-20020a05600c379400b003eb394741eamr1733368wmr.37.1679391079368;
        Tue, 21 Mar 2023 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set83a5kLYPxQseCGwbQfy54bilEAioFTvGeK+Skdq+MwCc/6WvQtJpuPIWOCAFRkLmB42AcqKw==
X-Received: by 2002:a05:600c:3794:b0:3eb:3947:41ea with SMTP id o20-20020a05600c379400b003eb394741eamr1733357wmr.37.1679391079123;
        Tue, 21 Mar 2023 02:31:19 -0700 (PDT)
Date: Tue, 21 Mar 2023 05:31:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230321053045-mutt-send-email-mst@kernel.org>
References: <20230312124628.8527-1-hengqi@linux.alibaba.com>
 <87cz53js85.fsf@redhat.com>
 <99f20219-931a-7b67-9768-0c2f8f32d16e@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <99f20219-931a-7b67-9768-0c2f8f32d16e@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v12] virtio-net: support the virtqueue
 coalescing moderation

On Tue, Mar 21, 2023 at 10:41:55AM +0800, Heng Qi wrote:
> Yes, I think you are right. I see that the voting has already started, do I
> need to wait for the voting to end and repost a new version based on the
> results?

We can always cancel the vote, just ask.

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

