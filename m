Return-Path: <virtio-comment-return-5155-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECDFC76188
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:15:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E982A29FF3
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:15:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7D2F9863E5
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:15:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CDA619863D6; Mon,  3 Apr 2023 15:15:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA5B39863DD
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 15:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BXEhiaqvP--HMgIw_3FFwA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680534899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgwH4oCBCf0jPkwxlx8km3PNg9Z2yw82zl1hnVHYuwk=;
        b=7wAb2xygNbcZ1OflaU0xsVuMfauPJ2SRSYuDHcyu0FTvol1XWXDqUjCV/MOAN1rkxn
         n9f1lgWZEwL8fAXR3RdsxgpKsG4X0FAh4l5mkTzoga58a4Af1cGPNTRLRZXbw+vGkVhN
         GmJi23Iw8aMBA78UwtR+cJoAZMq2rxncto3iKcXAJpwl6Ubg4joIi5B9d9QEsJ1I7/5F
         uZ+RaVsmtYW3dOD8rpSKj8ZQJDO3JrRmrUH/fyTU4VTzL7RjfLP3YgUoWDcTjW3NM/n0
         5V2IK8nrf1LQqWHWG8DCePcEjxAXVMAy217bMEc92kXKSAurTyTGR2YJm04R8XuJl0bQ
         SIjw==
X-Gm-Message-State: AAQBX9cZFFCU6q7bndBv976y2dru7AMtA6M6tdLZPRnLSAn0d3CLabEf
	NyoGEqgfIFCuYwrFOcID3zW6BvnMWFRdu9l8FeQSiK2EstBfET89g1ZF15f8ousaIIdx+9UORQV
	wN2rY+NOx4JAQR/5otzkfEXtuRsZixBuVRA==
X-Received: by 2002:aa7:d313:0:b0:4f9:e6f1:5c7c with SMTP id p19-20020aa7d313000000b004f9e6f15c7cmr36506444edq.32.1680534899177;
        Mon, 03 Apr 2023 08:14:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7I+xAmAjxoaMeKqToeR2B9SXFBmg0l8PDgaabjM1MkCb30pwDKYEDDduWc3j/pKCledJ9JQ==
X-Received: by 2002:aa7:d313:0:b0:4f9:e6f1:5c7c with SMTP id p19-20020aa7d313000000b004f9e6f15c7cmr36506430edq.32.1680534898934;
        Mon, 03 Apr 2023 08:14:58 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:14:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230403110702-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-3-parav@nvidia.com>
 <20230331024233-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481977FD9EF430B891A1F3FDC8F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230402035420-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FEAA37D23191932F5C7FDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403104716-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548146C767C1425EC9CC620CDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548146C767C1425EC9CC620CDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 02/11] transport-pci: Move transitional device id to
 legacy section

On Mon, Apr 03, 2023 at 02:58:52PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, April 3, 2023 10:50 AM
> 
> > 
> > No idea what all this means, sorry.  Please do not move text that affects modern
> > drivers to a legacy section. And we've spilled way too much ink on this already.
> 
> I disagree because spec do not describe modern driver and what you are describing is not aligned the way current spec is written.
> I prefer to avoid mentioning it again the same feature bits section that talks about Transitional interface.

Sorry I don't understand what you are trying to say here.  This is all
cosmetics, matter of personal preference.  But I did my best to try to
explain the reason this is not a cleanup but a breaking change. Was I
misunderstood or you just don't agree? No idea.
The reason for current placement is this:

	A conformant implementation MUST be either transitional or
	non-transitional, see \ref{intro:Legacy
	Interface: Terminology}.

	An implementation MAY choose to implement OPTIONAL support for the
	legacy interface, including support for legacy drivers
	or devices, by conforming to all of the MUST or
	REQUIRED level requirements for the legacy interface
	for the transitional devices and drivers.

	The requirements for the legacy interface for transitional implementations
	are located in sections named ``Legacy Interface'' listed below:


Binding to a transitional ID is mandatory for modern drivers.
*This* is why this ID can not go to legacy section - all of legacy sections
are and must stay optional.

What is true (and unfortunate) is that legacy sections are not as formal
as modern ones - originally we wanted them to be informational only. For
example there is no clear separation between driver and device
conformance sections.  Work on this if you like, that is welcome.
But please stop moving mandatory text to legacy sections.

-- 
MSR


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

