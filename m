Return-Path: <virtio-comment-return-8599-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591CFC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:18:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AC5E63E573
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:18:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EB429868A6
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:18:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5BD109862D9; Fri, 24 Nov 2023 06:18:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B8639868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sRs4pS81PBK42XElAYCfrw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700806685; x=1701411485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTH2CWyOReRIGhwRxn0Ozesp+iHiIW9T3MOt8l2L1O0=;
        b=gXCidEm1LFqOqxDNc4UOA2AyL19w2RlKDeLAmGK7ndhw+oky/EamtC8r1M+ELqaJas
         QDzH+vXTdeureW6ZirDFiHkAK1h0hgu6Uz/wshnlIEVZBZWT8eBwno93PUnzuaS8acgY
         OEyr9U8Eo6glm6PgvCiDX1ipBzU7dbPIv+QWoUg3FOi4+XksnbZ5oO2rfkyUdnC79iKq
         7xpESmJ2gtok6fHVLNC3t/Erxe1cNmPmTqoorfnWimXSNQNABijlaKAEWAgJN6r80FNX
         zXAsoQ6WRZi3YkF7xO2V2RRNZrYPe2x7Z43mNg1U8Au5eWJgdzk3lW4MYo9wmc41yM2s
         xxpw==
X-Gm-Message-State: AOJu0YxTT5VsY4rZ/FS+3cr7De9DjE/NS32wwNZwkX2h8HwMYJW101Jm
	3GC2GF+6lKjxgYsB4mZwra1fIlXVqSMal4oUIzXH0fHerG6/s34WklEZVMtJiwsC6YXTp9cnMUW
	KLR10LUlrPY2vQ33kt5+va/DGffKiETXVTg==
X-Received: by 2002:a17:906:b758:b0:a00:1263:8c4c with SMTP id fx24-20020a170906b75800b00a0012638c4cmr4181469ejb.18.1700806685376;
        Thu, 23 Nov 2023 22:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsLm3A1W1JrnfoDiKfLO85kO9qmV8llmWJFam7l8Zx4eRIAoWbfIepE/krlZfTnyFmv2x+Ww==
X-Received: by 2002:a17:906:b758:b0:a00:1263:8c4c with SMTP id fx24-20020a170906b75800b00a0012638c4cmr4181443ejb.18.1700806685009;
        Thu, 23 Nov 2023 22:18:05 -0800 (PST)
Date: Fri, 24 Nov 2023 01:18:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231124011125-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > we
> > strongly suggest that *drivers* support both old and new mechanism, and
> > then *devices* will only implement what's required.
> There are other examples in the same document that makes things worst with old and new.
> 
> Also there is literally no way to enforce that driver supports both
> and new. It is just sounds like an excuse to force infinite config
> space.

There is a very simple method though.  We allow devices to expose a
subset of features when DMA is not used. So drivers that want maximum
features will always opt for DMA. We can also strongly
recommend that all drivers support DMA if available.



> The method proposed here is elegant and clearly promote one way to do things for driver and device with predictability.
> 

I don't see it as elegant at all. What is elegant is *a single tag* that
describes each property of the device. And this single tag should be
good for everything: driver, provisioning, migration. And config space
offset serves as such.


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

