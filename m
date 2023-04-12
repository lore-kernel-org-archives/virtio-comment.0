Return-Path: <virtio-comment-return-5438-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1E6C77B6E
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:27:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D9A0341EE3
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:27:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D481098651C
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:27:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CCA1A986509; Wed, 12 Apr 2023 05:27:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B972498650E
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 05:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Clh9tub4MGiW5s7h9d-BSg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681277260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKUYr0lNtaArgZLaZ7jsbZFBZusg6bzDKx0cr/KAQEw=;
        b=aiCGXG1Ioo5zW3Bg+QZHYmz1VoLVU7tLb04ihjBUK+ABdA9vaCDxxKMNWh5n9cYVLu
         kneSWIDa82qfprcJNtBpi54k4k4Pb8adbWbgDMGzk2fYzBzJ1L7DDX4e49WdeEge1KAP
         vEjf0XtxTct54fXA8FLJAWQfKcOlTZCYgILzkTWS1S6mtWeIa3Vn5AsvFM/KR9rC2fmJ
         Mp7noQyFxr92UW/RQSkmp/OkLlU7bqIuTmQaFRNFpcevQH60IAV1paVnURtFOPl29pDv
         zdDUYmD/fMPpc+IfTeIiPAHmRTw7q4YLck7LtvEUcBBPZNmWc0TeELb9J8zi8KexXvfm
         odzA==
X-Gm-Message-State: AAQBX9fxBuQCeo0rR3JORf9862jK0mrlc5HttVZYOXfYB8OoO+ax44HL
	n2kyornzDXPeZOXDSo3xKNy+zuJ5tYMGqiKy9sjj+bXAlcFS+kMjPfnTkc86LgtIbH+xbpLKyp0
	N98G7Qp99cxubzd509EyQEciK9QIAkXldGA==
X-Received: by 2002:a05:600c:2307:b0:3ed:2709:2edf with SMTP id 7-20020a05600c230700b003ed27092edfmr12585967wmo.13.1681277259801;
        Tue, 11 Apr 2023 22:27:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y2EEceFQsuYBKrKq8mUU+RYE+mpxz/4dns/XfRt7k7TOhorlaLTZ8PU38z7C6AGSENcuPGzQ==
X-Received: by 2002:a05:600c:2307:b0:3ed:2709:2edf with SMTP id 7-20020a05600c230700b003ed27092edfmr12585958wmo.13.1681277259512;
        Tue, 11 Apr 2023 22:27:39 -0700 (PDT)
Date: Wed, 12 Apr 2023 01:27:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230412012547-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-11-parav@nvidia.com>
 <20230412003006-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481394D07C5CFBB2347B5F0DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230412004152-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548170E8002F19709C6D55ADDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230412010224-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481843F73EA11341608A1B6DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230412011222-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C76581B25BFE3892AF95DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C76581B25BFE3892AF95DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 10/11] transport-pci: Use driver
 notification PCI capability

On Wed, Apr 12, 2023 at 05:24:57AM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> 
> > > Such registers do not start the VQ data path engines.
> > > 1.x spec has done the right thing to have dedicated notification region which
> > something an actual pci hw can implement.
> > 
> > okay so.. in fact it turns out existing hardware is not really happy to emulate
> > legacy. it does not really fit that well.
> > so maybe we should stop propagating the legacy interface to modern hardware
> > then.
> It is not about current hw, utilize what hw has to offer and utilize what sw has to offer.
> The key efficiency is coming by reusing what 1.x has already to offer.

Just ... no. Either run 0.X or 1.X. This mix opens a ton of corner
cases. NOTIFICATION_DATA is just off the top of my head, there's more
for sure.  It's a can of worms we won't be able to close.

> > Add the legacy net header size feature and be done with it.
> Hypervisor need to mediate and participate in all life cycle of the device.
> 
> One wants to run the block device too. Current proposal with other changes we discussed cover wider case.


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

