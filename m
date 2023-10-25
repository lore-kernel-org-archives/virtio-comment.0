Return-Path: <virtio-comment-return-7955-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE3DC25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 73BAF2A8DD
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FED59869EF
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3F3DA9869E3; Wed, 25 Oct 2023 10:20:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A9059869E4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 10:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MCiDUIvTNVO9sWHLbFNRpQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698229188; x=1698833988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9GOp4AqdUV9GGxGOl+e18EPmOxmNKLbPAssIv9m/lg=;
        b=nXPAnar0+7zorSR0UqFw2ejJNKZPBq8sWpgUPWQJ601XtfMPe4Eu6BM5nqDjxziMQP
         bqCg1hI0m7Vx9muTRaUBqCok+hWqGymaTeSXIAj2gfIOHP4TxxZDbMSpjNQJHk9lAgfq
         KwPYrwToykZcOECGPdcWLpAIjbLgYXKcL4fQxedxH6KZW4n1rWv6egQOG/6rv468ROIR
         VJhWku59XpjplRBk3gcHYUEt7Xz/Urn6ojgdJo0frqTvmeFsJB59++pvjBATO1OtF0Xn
         9BxHkuENriKhA3MQ2WSUwbNG7V2x+giPEIDxlXzwthbCK/k5xyG+8LkWWUq4MpRQVSeg
         Oo4Q==
X-Gm-Message-State: AOJu0YwPeSdzLMg5cBMZ2DWZru70X+eHIXiOcBmyQ8+KdpguB08qXDVc
	7rsxHBNXo6Loqvb9mKQNBBbEk/0cgvQbuGfxt5NTorhFwRd8c195PjncgybVqSHj+hT4qIPudoN
	FIwCTzElzhRu8qAChISzcugX1wbbZ/cxPvw==
X-Received: by 2002:adf:f78b:0:b0:32d:a6f5:a511 with SMTP id q11-20020adff78b000000b0032da6f5a511mr9328089wrp.13.1698229187923;
        Wed, 25 Oct 2023 03:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaJLSk+AYIyGghy/KalBgaXRsk/3HIzQs6fkrl27LxdArRDFsuXcyoYBlIwTgk9svOIrmhOg==
X-Received: by 2002:adf:f78b:0:b0:32d:a6f5:a511 with SMTP id q11-20020adff78b000000b0032da6f5a511mr9328084wrp.13.1698229187630;
        Wed, 25 Oct 2023 03:19:47 -0700 (PDT)
Date: Wed, 25 Oct 2023 06:19:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231025061755-mutt-send-email-mst@kernel.org>
References: <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025041653-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B91F71A81D1B57401968DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B91F71A81D1B57401968DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 25, 2023 at 09:50:02AM +0000, Parav Pandit wrote:
> Hence, I believe device context as defined now is still reusable as common building block.
> For non-passthrough, such hypervisor can simply ignore the fields which it is not interested in.

Interesting. So a hypervisor encounters a field it does not
recognize. How does hypervisor know that a field is safe to ignore?

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

