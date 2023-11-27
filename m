Return-Path: <virtio-comment-return-8633-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC6C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:10:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E163A1922EA
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:10:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC0FF9863BC
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:10:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E21698638E; Mon, 27 Nov 2023 11:10:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8FFDD986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eKp_fDe5P6ysCt3vpDpwyw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701083426; x=1701688226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFBGDz0Uigwj7zEB6IyTFTIBrYlSMa35ndeoR6kxzq0=;
        b=UbJP+MSJeQkRPI1QBmV4w4E5MAHLSgp0n4H8/cf9swPJd6CuyR103w/Oc7fgsn/9am
         rAALnKkZeOBv4/YU/vXkAR84oFAo+S8iuBw1H5/j/1FuAEhmxMpa69F2R7qTgNMshrOX
         +2pZ/ukmYQP21K6+pYKSNh4pyKECZQEoh5WR0X1GbYeAismg3mUGtb6Fs7pl9iBxVoDF
         fCXV38Q5qeIAsd3QR00ZpFOLjMy88+EAaj+jZJQlWaSuJoSGa1xArNoRpcz0Vv+725Jy
         IKlg7y1pM6f4MsnH7U1mYy1kQydXWFHdT6pG0AJfUvB/rlYynBQjZ/Zl70lTzAKdB9pN
         duCg==
X-Gm-Message-State: AOJu0YyXfxkMRJfxFA87UX2YPadZXsaSJ33lSyRL6agtNsVic5hpi1D/
	7mDQq9JGMQWjkwZ/rcuXv5Hu+YgA+Cym7lLMmmU+53KhY1n1rjpkStE2/w3XHCsThGzdNxrEaNv
	Ql1WqwlQCGlnUe7aLZGnMv1QHmz7MvzppDA==
X-Received: by 2002:a17:906:51c8:b0:a00:2947:409d with SMTP id v8-20020a17090651c800b00a002947409dmr7659344ejk.12.1701083426644;
        Mon, 27 Nov 2023 03:10:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYG4tm5m+aFRgKNUOVwWJVryEV3Dfc0CEUw29Ri80ARd1aC/PN8F1mG3HnD2HtRMybt0d1nw==
X-Received: by 2002:a17:906:51c8:b0:a00:2947:409d with SMTP id v8-20020a17090651c800b00a002947409dmr7659334ejk.12.1701083426330;
        Mon, 27 Nov 2023 03:10:26 -0800 (PST)
Date: Mon, 27 Nov 2023 06:10:21 -0500
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
Message-ID: <20231127060729-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124040545-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548153830F24B8B8A22E3BDADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548153830F24B8B8A22E3BDADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 10:19:45AM +0000, Parav Pandit wrote:
> > 
> > > The bright line in based on this usage: bootstap or not.
> > > If its runtime, sure have it over CVQ.
> > > Following the nice tenet of B.2 of the spec snippet: "Device configuration
> > space should only be used for initialization-time parameters"
> > > That’s it.
> > > And everyone is already aligned to it.
> > 
> > Absolutely. Specifically, when do you expect driver to probe these caps? As
> > you yourself explained, it has to do it before ethtool calls - that clearly means it
> > will do it in probe.
> > To me this simply screams "initialization time".
> > 
> It can be done in driver probe routine after DRIVER_OK, this is fine.

No - it is preferable to do it before DRIVER_OK because
VQs are probed and initialized before DRIVER_OK.
For example, it is reasonable to decide to only enable MQ
if specific flow control can later be enabled.

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

