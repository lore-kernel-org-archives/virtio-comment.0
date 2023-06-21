Return-Path: <virtio-comment-return-6443-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB7EEB64DC
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:45:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C555788E03
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:45:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE7899865C8
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:45:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A13959865BA; Wed, 21 Jun 2023 19:45:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F2139865BD
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 19:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vS4ykeLdN26YJp3fK3BL4A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687376721; x=1689968721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEI4KCDDyI3eztLKZfnSSvulBzZfTOdfhV/ovC+VLXQ=;
        b=ghcAUHG1zPaLGZkUKR3Y5VNY+seN9A+NMc1+GXAUSlbEDw/ieWEsOIvZo4R/31WUK/
         DErkSCkP6CZkIEElsSJ9jXSCtrcOOEUiBfLHTgTJYChromE2Derpb3DbvrV//hv31lCN
         D3G1lZyoThKut+Kes8JBswZqxM/GYGoPX+kxd1024apLSgqdPkNaxg/skq2t7LisXAcK
         iLmitR367NJPfqYv97FAnTihm7PgA+mUbU/i5djDfs6/8g4j3XAHlpo9Fpl9oYu+77/K
         x/lice1uA/J/inkyFzaQQRZs1TXivVAXfSbFkSt2rPm8lg8Ese2izQ1EcUum6+dnYoYz
         zDlg==
X-Gm-Message-State: AC+VfDzPFTnPv2XQVT3oyAm2NykHZEL/V9xUTgKRzpyJYy5S+Rshgozl
	1YTTC4Lb5CyzUcWR2S/y29N20P2s1gltwpd/XmkgqtiAE6mkT3/AQ2H+hEaCBiWZhtjLfkKqZ1S
	Qv1uPDMqZyxdGlbu0wY5bTd3MeYnzw4WrPg==
X-Received: by 2002:a17:907:36c8:b0:982:7434:ea84 with SMTP id bj8-20020a17090736c800b009827434ea84mr20116142ejc.10.1687376720990;
        Wed, 21 Jun 2023 12:45:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6TlHphfBdzSgimoTMX2gKs3kWB1HVhIxvFmOgZeQqhMZ+urjdFffQFOHBX4PRccpBdoXlgKw==
X-Received: by 2002:a17:907:36c8:b0:982:7434:ea84 with SMTP id bj8-20020a17090736c800b009827434ea84mr20116127ejc.10.1687376720654;
        Wed, 21 Jun 2023 12:45:20 -0700 (PDT)
Date: Wed, 21 Jun 2023 15:45:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230621154329-mutt-send-email-mst@kernel.org>
References: <20230621135052.76028-1-hengqi@linux.alibaba.com>
 <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <PH0PR12MB54819746DF66F968E532195EDC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621152451-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FDB711FBC0528822106FDC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621153237-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816D7D508F94ADA30E2CC1DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816D7D508F94ADA30E2CC1DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Wed, Jun 21, 2023 at 07:39:19PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 21, 2023 3:36 PM
> > 
> > It can be helpful for debugging. E.g. if driver sets a bit that device does not
> > recognize, it can figure out that driver has it set in supported mask.
> Device is reporting error code anyway when it receives a unexpected command contents.

To driver, yes. But if you are debugging this from software device
side then getting info about driver state is helpful.

> > Or if it seems like a waste we can just ask drivers to put 0 there, works for me
> > too.
> 
> I fail to see this being any better or equal to two structures.

One structure is just simpler for software than two.

> > 
> > 
> > > Two structures are cleaner.
> > 
> > Frankly what's cleaner is what RSS is doing, supported mask in config space.
> > Was this discussed in some version? I don't remember.
> > 
> Yes, we discussed. 

Couldn't find it and I don't want us to repeat same agruments.
Which version had this field in config space?

> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

