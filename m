Return-Path: <virtio-comment-return-5166-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26374C761A6
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:28:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E365429FC4
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:28:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8FA1B9863EF
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:28:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 859E49863E6; Mon,  3 Apr 2023 17:28:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74DB398644F
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ac1Y9RdkN-e3gBth8lDNBg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GlRrkyZzim01GGc7lyDWxnpW7+xPDIXk9E9MQU++zc=;
        b=sIOfBLcs7W9kR3y8u/W39sHiUBttNodL/0gt1Haw2tol1WPlcTvTxre/zgPjYVb31f
         gKYOs8+oSdpsP4Ub2M0XTrS63X311l2YSUQjW/u1+tK/U5/G814XCuyMeLoLc6chfS3Z
         MpSkdaodGvzLTkvmXZksB8Xlmg4EVsUkFVvUZj9+hW77yrBRCawtLoPiSwLENUhHc8S4
         jyr5jeOpLTEmpoqJFeszlst4w5GDDXunWe9bgQ38YH1hG9Y6CLH7qJ/3rwENGmN3N5Fx
         OLklfwYGB6MkQKAmwDLuNVm7jY19WrsWTO9h8gbIoyhaewqodu08sFA5TFIhkfJ+vU9g
         1VnQ==
X-Gm-Message-State: AAQBX9ex4agXKUHbePEY7xm5ykLnuYgXFFs5tyUr8t77YlNVgZlRGVBT
	Y8I2r2uMcQYnU8K0ZqH6EJjvH4rnFDZQz/aS3PvEG+gZPYtD6cX12Xh5st9LGcdgTrZHXrKiE7f
	kE0jsjTwWcTd+U4cOcwtG0wDpxlCf5Mj2cQ==
X-Received: by 2002:a17:906:f190:b0:931:a321:7640 with SMTP id gs16-20020a170906f19000b00931a3217640mr39094895ejb.74.1680542889525;
        Mon, 03 Apr 2023 10:28:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350YG4bUnwfTLO8tAPuP8GzcE/cpXQsXY5czlxpJ5iZo8wEme8+ol7ewV0/U72DtQhc5aIWEgBw==
X-Received: by 2002:a17:906:f190:b0:931:a321:7640 with SMTP id gs16-20020a170906f19000b00931a3217640mr39094877ejb.74.1680542889198;
        Mon, 03 Apr 2023 10:28:09 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:28:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230403132442-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230331024500-mutt-send-email-mst@kernel.org>
 <0dcd9907-4bb0-ef0d-678d-5bc8f0ded9ec@nvidia.com>
 <20230403105050-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D50080A3A7C5F81E3F62DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403110320-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EC65708410304D9C1EA3DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403111735-mutt-send-email-mst@kernel.org>
 <20230403113130-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815BFAFF4BC17F37864B8FDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815BFAFF4BC17F37864B8FDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 00/11] Introduce transitional mmr pci device

On Mon, Apr 03, 2023 at 03:47:56PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, April 3, 2023 11:34 AM
> 
> > Another is that we can actually work around legacy bugs in the hypervisor. For
> > example, atomicity and alignment bugs do not exist under DMA. Consider MAC
> > field, writeable in legacy.  Problem this write is not atomic, so there is a window
> > where MAC is corrupted.  If you do MMIO then you just have to copy this bug.
> > If you do DMA then hypervisor can buffer all of MAC and send to device in one
> > go.
> I am familiar with this bug.
> Users feedback that we received so far has kernels with driver support that uses CVQ for setting the mac address on legacy device.
> So, it may help but not super important.
> 
> Also, if I recollect correctly, the mac address is configuring bit early in if-scripts sequence before bringing up the interface.
> So, haven't seen real issue around it.

It's an example, there are other bugs in legacy interfaces.

Take inability to decline feature negotiation as an example.
With transport vq we can fail at transport level and
hypervisor can decide what to do, such as stopping guest or
unplugging device, etc.

So something like a vq would be a step up. I would like to
understand the performance angle though. What you describe
is pretty bad.

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

