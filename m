Return-Path: <virtio-comment-return-6933-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2A0C001DF
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 09:12:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C0D9E1EADE
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 09:12:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85CDC98638D
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 09:12:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A298986367; Mon, 31 Jul 2023 09:12:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62B3698636F
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 09:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Iyg4IFU1NbGXNsD629ndQA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690794724; x=1691399524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJhT3l2NEk9PpQ+1C7KEyFzzGT4ynYOP91mgc17w0bI=;
        b=Z4PrFQFWEbncLWQzZD5ONsTBCC8U4A6sC8q9ZMxlqGD8i2XYcLVRoOQKH86j8oIu2l
         hloxmKcdk8vFD01Dx9wQxI4pjWn9wh6IEACUqEJ2ta+vveiSnCMT4HZj4rqqnUpYSHv5
         Dj0ZnRfFY4+EEV80x/ddW+FdaDu2fmvZHIY3uEWz2LGuAJaTz/uPXZTiftWqPkabLaoC
         0NT0OEWb89+bnzdYDlfFaLeVe5CZIdSAYuJoI6Y0qLfaZFE3FTsGoicWtmMgtOJ6Szvl
         rFJ9gENvkVWLXQt+L6Ddu5bVeQLV+Jro4YnUlV78qWuwec3QyUSk0xeOsiQDeHLj/doy
         TF3g==
X-Gm-Message-State: ABy/qLbDK5XHVP8T5QfXuTYm5LGN3GhE9kq49mWOt8H4hdnQ+ufIlMSb
	V9440EbCktbhKcB5/1Z0hVJ5sHJXXmKLVz9G8XYInXLtmzEtBW7Pse14h32d4N9Ke1jecV9gaZy
	IltPy+0SQ1aGKk2FaylWRfJ0IJuUBEZyVZw==
X-Received: by 2002:a17:907:7709:b0:98d:5ae2:f1c with SMTP id kw9-20020a170907770900b0098d5ae20f1cmr6484488ejc.34.1690794723952;
        Mon, 31 Jul 2023 02:12:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGezhlW5DnP2jd+oOtGQvHQV2Hd/k+/RN6X/HFJ8LBbk+rnprAswGkr5SwNzM+VaEuOs+D+CQ==
X-Received: by 2002:a17:907:7709:b0:98d:5ae2:f1c with SMTP id kw9-20020a170907770900b0098d5ae20f1cmr6484476ejc.34.1690794723615;
        Mon, 31 Jul 2023 02:12:03 -0700 (PDT)
Date: Mon, 31 Jul 2023 05:12:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230731050908-mutt-send-email-mst@kernel.org>
References: <20230726081229.55947-1-xuanzhuo@linux.alibaba.com>
 <20230726070801-mutt-send-email-mst@kernel.org>
 <1690422490.8491526-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548149ED4C687913EDA3EED9DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548149ED4C687913EDA3EED9DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v13] virtio-net: support device stats

On Mon, Jul 31, 2023 at 04:32:22AM +0000, Parav Pandit wrote:
> I have two proposals to for the dma interface and we should discuss that in separate thread to not mix the cvq parts of the stats.
> I will start the thread shortly and put pointer to this requirement of counters + many others that we are discussing including ntuple.

Great! I agree it is best to discuss infrastructure work like this
now while we are in freeze. Merge this early on 1.4 branch so
everything else can depend on it.

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

