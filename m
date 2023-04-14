Return-Path: <virtio-comment-return-5484-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5157DC77B6E
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 07:05:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 89B0C2AF85
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 07:05:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76384986602
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 07:05:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A2C6984140; Fri, 14 Apr 2023 07:05:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7DB1E986601
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Apr 2023 07:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _ephXwBtPc26gPEyRGheHg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455918; x=1684047918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvpFz4ZLqiK0qV8B0SfSQfts6ImbDOd/szejex6u3H4=;
        b=cGUcMZ+085uwe/ADzlSoMmj7s86U3e62CX4a+9+mLY0oQ9R5cy0Eu8hBC+hWMvqrmv
         Hh1vBlvso9EFNdhyL3peCaBY6lQ/4uKBJySx0u0FP03Zlc5FbbL6UQLnrGzPNzhjl9ib
         awSAbWqRWEVgSMp4yDM/keVxAq2ETkcTzF+n2/v1UbvBCGWsQNQ/hJ+eAFXa8gr3KcZM
         rBN4YqXmZuH0zjRuUZy3DBbN6zn+2HvtiYweQGl+BF3vqac25hkov9+83Jec+pRO+3pN
         /dDy5gCvCHAhPBk3PeUA+YNESGd0m5ih3Mz5JGeBAlVFSlp1hLFCHdqGIL01r9xi3n+F
         kRiw==
X-Gm-Message-State: AAQBX9dB4IU/euYa4uzfwyG9JFc+vC2inNScpEHwr8IfEwUUdNmc+fIE
	ZkfV1QHshkW/FbegN64LB7uKnoS08I1/LfYSGhUcqiIWh/+B2Rcj182iL5CoIc+qpFdOG+uH/bh
	O/bJYSLT3atmDb15ambXx7kMkPhZR0Ab2Qg==
X-Received: by 2002:a1c:7901:0:b0:3f0:9562:cf56 with SMTP id l1-20020a1c7901000000b003f09562cf56mr3861293wme.3.1681455917870;
        Fri, 14 Apr 2023 00:05:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z6zuTa2nRf8B8CvF/Fmrc+JkL1Q1BYwtUcFCwLLoPQINfTCAbcah0PpoaB/K/A10XelVzsIg==
X-Received: by 2002:a1c:7901:0:b0:3f0:9562:cf56 with SMTP id l1-20020a1c7901000000b003f09562cf56mr3861273wme.3.1681455917549;
        Fri, 14 Apr 2023 00:05:17 -0700 (PDT)
Date: Fri, 14 Apr 2023 03:05:14 -0400
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
Message-ID: <20230414030103-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481F0CF5A555A6BB2CE856CDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuNOYOxvcSzrs0UFEyk+xOkGUpOfhK8rOy_Mebz5b5wdg@mail.gmail.com>
 <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com>
 <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
 <20230413130326-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819A5D8FCEC6375D80897DDC989@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvSSXyXQnRs=OiaSJnSEYHP83chL6-B5ZPCGx6TeW9W5Q@mail.gmail.com>
 <PH0PR12MB548135CF5268D979A6D8EDE8DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsHtC99kTTa0TrfeJuhV+F7e-WF7XRgbLJkCBQeAxW8pA@mail.gmail.com>
 <PH0PR12MB5481C29561D5E48BA5D8AEEEDC999@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C29561D5E48BA5D8AEEEDC999@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Fri, Apr 14, 2023 at 03:51:01AM +0000, Parav Pandit wrote:
> 
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, April 13, 2023 11:38 PM
> 
> > > > 1) spec doesn't enforce the size of a specific structure
> > > Spec will be extended in coming time.
> > 
> > It's too late to do any new restriction without introducing a flag.
> We are really diverging from the topic.
> I don’t think it is late. The work in this area of PCI VF has not even begun fully.

I think Jason means that any new feature needs some kind of approach for
compatibility, given a huge installed base, a flag day where all old
drivers stop working on new devices does not look acceptable to him.

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

