Return-Path: <virtio-comment-return-5171-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA23C76196
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:39:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1488160248
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:39:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EBDF9863EF
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:39:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 057AF9863DE; Mon,  3 Apr 2023 17:39:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E71239863E5
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ksCA1RxGPQ6rBOURqrvIkg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680543579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz5jn54HVTndGGYzV6ETMhEx9ExZSY/tpkge414DE0A=;
        b=4cCaGyENUz/qd/aYjLfuvcX16d3Fkq1btHGa00EWjnuuYAfcHFtFQWenmOW0QIPUTD
         Qh7SBbLKnEZHLHRjS1Mzeblmqn34C+mQrARimbhotF3zDPMy/Iiaa0+OkWDFLGBxlAMB
         HPGicMABX1q4YtqCgE5nBcEinyUiv7ClXWO/a8nLqOOCuSSdPOMu/7Igkiq+IGFg5a7o
         S2o3/NoojI8EM047ZmNQg47G8h8ch7kEkS8YonONkahPPQ41JYhRZVmgCwOpq+Bakb4e
         Xgm7aLlHGFixdThC1FnSE9VgxWaS0AHbmuD4fpVX/3ubETzviSPXYN+myQvKOBZStB6c
         Qy/Q==
X-Gm-Message-State: AAQBX9dV0sbr3VudWY3qtEayEK+tebNwmwW6fQhoLBh9TRGYgihKNjS1
	644ju3COY8hkIl5A3C2qDq2qEoZJaV/xyTIhDmXqRGmtJjPWfEJgPPyeBpxJRkqE7JmGiK56OSM
	VB2SHu/F4YRuv3eyDT6PdUJNqwNwIEWvFkw==
X-Received: by 2002:a17:906:7817:b0:8ae:11ca:81de with SMTP id u23-20020a170906781700b008ae11ca81demr35929627ejm.34.1680543579102;
        Mon, 03 Apr 2023 10:39:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZN4kwSEQ1vAJaPwMAODdDN6shJlr7zjgt4Wvzv4YyX9laB1E3lQ0cIhFxpemIJGapacnm1AQ==
X-Received: by 2002:a17:906:7817:b0:8ae:11ca:81de with SMTP id u23-20020a170906781700b008ae11ca81demr35929613ejm.34.1680543578866;
        Mon, 03 Apr 2023 10:39:38 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:39:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230403133724-mutt-send-email-mst@kernel.org>
References: <0dcd9907-4bb0-ef0d-678d-5bc8f0ded9ec@nvidia.com>
 <20230403105050-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D50080A3A7C5F81E3F62DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403110320-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EC65708410304D9C1EA3DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403111735-mutt-send-email-mst@kernel.org>
 <20230403113130-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815BFAFF4BC17F37864B8FDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403132442-mutt-send-email-mst@kernel.org>
 <e48d2980-2a23-29e4-0628-cd812f324985@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e48d2980-2a23-29e4-0628-cd812f324985@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 00/11] Introduce transitional mmr pci device

On Mon, Apr 03, 2023 at 01:35:01PM -0400, Parav Pandit wrote:
> > So something like a vq would be a step up. I would like to
> > understand the performance angle though. What you describe
> > is pretty bad.
> > 
> Do you mean latency is bad or the description?

I don't know. We need admin vq and transport vq to work.
You describe latency numbers that make both unworkable.
I am interested in fixing that somehow, since it's a blocker.

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

