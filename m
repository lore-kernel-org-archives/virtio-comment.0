Return-Path: <virtio-comment-return-7861-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F1DCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:53:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 22B75109D08
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:53:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 088209868E0
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:53:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E9C6F9868D9; Thu, 19 Oct 2023 09:53:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DADFF9868DA
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3WUf6fxaMIyDpryxzEzmEA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709210; x=1698314010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAhpKnxgzKPOy8lun1wRyGF3a7Woxaefb/iBAl6+KfU=;
        b=u8W5t4Viuf3WVw0/HDk+bGAv892EAKL+r/jPK5V1nKCChKtX6Tm3zgy84/fsISefKN
         g1Y14lJbrb8IU+AdBPYU9MbZo4FRmnQZbuDo/vlkZ/1NO6IjoKfUOYcKgcMs4BMqc5+t
         IbIpAIO45fXf3fdz2spiti9joMPZ2lbGF7Ty2NJ64XTRFCaE8g2uKP1LTg+vZUpBlygH
         K/jTswc4lnXxW/3iYCVesfjPseRlLv3BxzEtSpyKwWnRYoExZ69rvXV1MCQabPsdN/VT
         GMSqTipRYpzFArPR8C0DRgTeflrm5bl2MQrIWIWkHrkUAbsMobWjuppUnzdxLyJHM5Q3
         xYAg==
X-Gm-Message-State: AOJu0Ywx+jDokE3B+csJl/3WAUPqXifpK0Q57bl3GF6jT2iNQkmifhF6
	Fnq5Z4PplO97sf58iAuTUnl7+nyQcFD0oOwhW0u9nfkWnP1mODHPnau6jZQXkKwxaqlLwb/o8AB
	nLfjYQPixx0vxtmRtBlmEck6qrOH9u57AOA==
X-Received: by 2002:a05:6402:34d3:b0:53e:b8e2:1d58 with SMTP id w19-20020a05640234d300b0053eb8e21d58mr1203282edc.13.1697709209934;
        Thu, 19 Oct 2023 02:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAC2irYnq3GZIExw2O4bN4pqs4vZz2U+WpPWMilCRPa9sHSahsLqXGw5ySbna3p9pLCNgBqw==
X-Received: by 2002:a05:6402:34d3:b0:53e:b8e2:1d58 with SMTP id w19-20020a05640234d300b0053eb8e21d58mr1203263edc.13.1697709209584;
        Thu, 19 Oct 2023 02:53:29 -0700 (PDT)
Date: Thu, 19 Oct 2023 05:53:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019055251-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
 <20231019052725-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C638743682F55F11BA28DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C638743682F55F11BA28DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 09:41:46AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 19, 2023 3:03 PM
> > > > > With a capability you can discover it without poking at features.
> > > > >
> > > > It is discouraged by pci spec.
> > > > Pci caps for mostly doing very small init time sort of config.
> > > > Not to run frequent commands.
> > >
> > > Interesting. where in the spec exactly?
> > 
> > And the reason I ask is because I'd like to understand the exact limitation.
> > 
> > In any case, we should still maybe look for ways to separate it from config.
> > Maybe a capability points at a BAR and that is where we have this stuff?
> > 
> Yes, I replied in your previous email, a similar suggestion.
> Lets first agree that it is drafted for non-passthrough mode.

I could see passthrough use it too if there, why not.

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

