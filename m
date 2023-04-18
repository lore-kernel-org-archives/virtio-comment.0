Return-Path: <virtio-comment-return-5516-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C340C77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 12:31:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2E22686685
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 12:31:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24D16986402
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 12:31:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1D0E09863E3; Tue, 18 Apr 2023 12:31:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C6189863E7
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Apr 2023 12:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: pUdcgyZIPM-ckaGnSKq7bw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681821054; x=1684413054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsqjwvq9uPHLN3lB1D+MMFVglRiAnh8cLkM8J8w+aKc=;
        b=Wtr+MaaOFdZ6g1CV6QOv19L2ZLvzCwJsQqOejKbVJu37zY2H6CJQYrjDbaa6maD+NQ
         QAzGeubUePNsSJnXL+xV1hAt8VuZ0tFIrLBJ35qEY3bNJYN9IPyNBmD5KOFgEhXPXFhM
         QKyrO/pp19atmfbekcQJGzeNnXjkSbnXlnv7Qy+i+nMh2y4YkmcXlFni/MDxWWzDkPz6
         TpNoseZ+lm4UwIuWhwC3oeTzBmo3bSLXrx2Ogx6B1lH4BKbJ+fHl3DXStyUzyFcrTk8n
         HPi8HZiq8LOukezW6JAe7VfU2QanxnlijWRV7plnJj13TRYk+yjvhauzNnPHokZRTKIw
         FlCg==
X-Gm-Message-State: AAQBX9d/cHLkJ6stNoq8crOCEPMbryzwTobGc2om0Mpxg2x8aT/vD4Jp
	+XfzDzWyjp8A72P0fj1tmsY5eXLfAMWe+cMAX0qwkj8pnHwVOHAUYgYG155+NcAvpqpPr6vZzsj
	isCuWD+ZlGh0pT35f2U6drlbhHyKXalqe+w==
X-Received: by 2002:a7b:c848:0:b0:3f1:7372:f98f with SMTP id c8-20020a7bc848000000b003f17372f98fmr5106929wml.41.1681821054512;
        Tue, 18 Apr 2023 05:30:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z0ufqTCdYLM8hRWrBzsyjfQ9/NwpbEcraymcIRZ9WfTHjWJv/OTGVxfNqC4h6SSbnHehtzdQ==
X-Received: by 2002:a7b:c848:0:b0:3f1:7372:f98f with SMTP id c8-20020a7bc848000000b003f17372f98fmr5106912wml.41.1681821054243;
        Tue, 18 Apr 2023 05:30:54 -0700 (PDT)
Date: Tue, 18 Apr 2023 08:30:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Yan Vugenfirer <yan@daynix.com>
Message-ID: <20230418083018-mutt-send-email-mst@kernel.org>
References: <CACGkMEsHtC99kTTa0TrfeJuhV+F7e-WF7XRgbLJkCBQeAxW8pA@mail.gmail.com>
 <PH0PR12MB5481C29561D5E48BA5D8AEEEDC999@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEseO=4xDA+pH2x=CaJ6XyzHEx1ZFO-+uevJH50kLeSWhA@mail.gmail.com>
 <PH0PR12MB5481FFC95F54AD048927FF12DC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230417162618-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481710854882449008F28BDDC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvPv7eH3+cggcCVZvRCqkNCh_CX+6azNJtdJUDxjjAjwg@mail.gmail.com>
 <PH0PR12MB548113626CD6C7B2F8589042DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230418075401-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D2E9CCDD9B813F420A81DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D2E9CCDD9B813F420A81DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Tue, Apr 18, 2023 at 12:09:17PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, April 18, 2023 7:58 AM
> 
> > I think in any case, using device through two transports at the same time
> > shouldn't be legal.
> 
> PCI is the transport.

... and AQ can be a transport too :)

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

