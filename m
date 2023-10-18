Return-Path: <virtio-comment-return-7783-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFE8CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:05:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 629DB45B2E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:05:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38101986898
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:05:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 188B098688B; Wed, 18 Oct 2023 06:05:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BB1B98688C
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kF2bBsVdMs-3xHojb5kikA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697609075; x=1698213875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gevqtTzrOJX/EWXP27dh4mudLfYT5/DKVoGVfG+aqDw=;
        b=EwyvbZU9OJfwjYg9yf2Y0mvWvoyKqbjtyn62FRfqutyEUgNC7vonoK40sXakdI3GPb
         O7NaieBAQytkubo4ZN6WY0Sy1+mtuGFFolBqe3rQyuH5OEUkyncPjjRdL1T4ik2J1vlQ
         s7IapT7v8xK6/sW0Ds96VNfeFfC2bLu8qVsN7BrV0k9UMcaTgdTdAcE+pkVxUdYfPNS5
         fp0Zmgb+KCs8U6fzpWWsCp8pIuHMI3S/qPHmJtDY+L3LqbnYdhqpdiFEQCOE+Nw60a1C
         3E3vXquR9cRUon0K4gGu7sjp9+3LAzi+GEOHP4Yq2Iv0goy6TPCVW/vzgm6kcwjzIr/2
         +aEQ==
X-Gm-Message-State: AOJu0YyqrDgRtiTN5DXNG21Tvgm6l2Q5Hpg3Qz2j/7zwFBFo89t6WtPt
	1Nvs/suYp21E7ZGgfqVFqm9M3v+SS1/GF1eY3J8r9eVZC6/tvFxygEoya8kJfzd7sinfLT/veyK
	SXv6oFGPme+C/MiSmChge59OGHDNXwOtp6Q==
X-Received: by 2002:a5d:51c1:0:b0:32d:9f1b:3a1f with SMTP id n1-20020a5d51c1000000b0032d9f1b3a1fmr3632256wrv.31.1697609074945;
        Tue, 17 Oct 2023 23:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv6lWN/M9RKNokQ5pLhjT+HGsiUYQus/JiYBZ+ZKRrNMIuQkuxDqrWM9zYXMo+56+v1U4dxQ==
X-Received: by 2002:a5d:51c1:0:b0:32d:9f1b:3a1f with SMTP id n1-20020a5d51c1000000b0032d9f1b3a1fmr3632240wrv.31.1697609074633;
        Tue, 17 Oct 2023 23:04:34 -0700 (PDT)
Date: Wed, 18 Oct 2023 02:04:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>
Message-ID: <20231018020403-mutt-send-email-mst@kernel.org>
References: <20231017200645.779222-1-parav@nvidia.com>
 <216b7799-9449-4271-b50f-1faead34bd9d@intel.com>
 <PH0PR12MB54818B90249B51BC2803BB9DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818B90249B51BC2803BB9DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands

On Wed, Oct 18, 2023 at 04:04:15AM +0000, Parav Pandit wrote:
> 
> 
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Wednesday, October 18, 2023 7:27 AM
> > 
> > > Changelog:
> > > ==========
> > > v1->v2:
> > > - Addressed comments from Michael and Jason
> > > - replaced iova to page/physical address range in write recording
> > > commands
> > > - several device specific requirements added to clarify, interaction of
> > >    device reset, FLR, PCI PM and admin commands
> > > - added device context fields query command to learn compatibility
> > > - split device context field type range into generic and device
> > > specific
> > > - added device context extension section to maintain backward and future
> > >    compatibility
> > > - several rewording in theory of operation
> > > - added requirements to cover config space read/write interaction with
> > >    device context commands
> > > - added assumption about pci config space and msix table not present in
> > >    device context, which can be added when hypervisor need them
> 
> > We also didn't see these issues addressed in your V2. So, what's the purpose of
> > releasing this V2?
> The purpose to cover comments and improvements from Michael and Jason as listed above.
> Only questions from 10/16 and 10/17 are yet to cover.
> I will answer them this week.

Maybe mention this in the cover letter next time. Thanks!


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

