Return-Path: <virtio-comment-return-6866-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F4CEB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 12:48:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F0BC51FF6F
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 12:48:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D89FF9867B3
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 12:48:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C29C69866A2; Wed, 19 Jul 2023 12:48:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFF429866A3
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Jul 2023 12:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OojDTzwCMwaNbOugvoSH-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689770915; x=1692362915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pEjL62Yrx60IrxVl6/8Mhis4lDwfaaTu3Ql/zIc4dA=;
        b=CRN9rFxAUykHJeCTTjOI0yJVU2ktwB8l4dv7XFRgTxPcRAQ4USdwd9UDe/FQW9NGs1
         8ZXKeSq52X98AJYLfEv+OMBS63zGGLr0tRG69k2o/dKEu143mtK9K6rvcQAXNV/WMUNP
         v5nOat2sucMkrrLAW/7Lx68ROqZ0pvMsg7m3ZBWKvdJgf/CYKQq85kAczXsomgI38V1j
         4eVERwKM9jFArpLhn18/OvChGRQ3vXDv2WhL2YIyJAzC1LSIN3bNeeb1lBRFzV7CqI6K
         64e7ZgBvf4wx7EXHrSO1nURiAcCWSau4BmWVtrv1egZG0JBiBopV/soDWeuACSjTA/kT
         ZjLg==
X-Gm-Message-State: ABy/qLa2nZ5/wC3CVDBoiFtADruW3lTlB5f4jVK7kfI/tLxeC+JnMfmh
	jl1L3sroLfclTSJlB94wXT6iETg2gcblZvnrYfgUW2b+TUq2p2jnyTdZdYMQzcDPC+p0fPthYH/
	ogLiAIw/O5RKf3QtATeqvY04axzKRXYRkow==
X-Received: by 2002:a7b:cbd6:0:b0:3fd:45b:45f8 with SMTP id n22-20020a7bcbd6000000b003fd045b45f8mr1193859wmi.23.1689770915687;
        Wed, 19 Jul 2023 05:48:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEeJRJj8GmQVRChO93GoKIoCwf946Zk8qkl0aCaDPCB68SK5EGIyMX++4unoiUHN91BUjUkLg==
X-Received: by 2002:a7b:cbd6:0:b0:3fd:45b:45f8 with SMTP id n22-20020a7bcbd6000000b003fd045b45f8mr1193847wmi.23.1689770915359;
        Wed, 19 Jul 2023 05:48:35 -0700 (PDT)
Date: Wed, 19 Jul 2023 08:48:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Message-ID: <20230719084646-mutt-send-email-mst@kernel.org>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <aae0b5ac-96ad-00ab-ace1-9fa2c0a15498@bytedance.com>
 <PH0PR12MB54816BDFABCC4F2D7DD9D95EDC39A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816BDFABCC4F2D7DD9D95EDC39A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics

On Wed, Jul 19, 2023 at 12:44:52PM +0000, Parav Pandit wrote:
> 
> 
> > From: zhenwei pi <pizhenwei@bytedance.com>
> > Sent: Wednesday, July 19, 2023 3:07 AM
> > 
> > Hi Stefan & Parav
> > 
> > Ping!
> >
> 
> This task is not in the top items for 1.4 for virtio, so had slow progress.
> I will spend some time this month.

maybe it should be :)
zhenwei if you are going to do something as significant as adding a new
transport you really should join the TC as a member I think.

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

