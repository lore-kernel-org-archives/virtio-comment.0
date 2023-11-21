Return-Path: <virtio-comment-return-8508-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2218C61D85
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 21:00:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 283532AEE4
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 21:00:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0928998689C
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 21:00:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E62D0983CFD; Tue, 21 Nov 2023 21:00:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2F8F986890
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 21:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: efnJDQSdPX2-hFpbxgbZIg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700600439; x=1701205239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0di8ZNYiKWXVuJgS3XtE6wLqmM/UCK2Cop20UdINtWw=;
        b=WE7w6ihcPAjRcI/RYkLLBg9A5YhVGspXxJjtF56qnW0SpuU9MCaJYJhtBqIXry8nTx
         kuZjkkwgbh1v+yYGkJ/7kBLPHnPZoeBF7EEsDXLVLrDxT3hfSP80mza/aPYpOoGfTJ5a
         /d6XRraNV7wcvMWeGMrsbKIFmE1e8c4naUuduyzOd45jNovdH9I8LIcfno54bY9DgUjx
         GUvy4YxMqO2fuCkaKQOkQkVLSfsKSSaN/nX0AxTW9DDA+twpqYf71IqyZT4yJ7IyF7+k
         tZP5vDw248VlLQwylRxpzaUBjtUqOJ3mA4SRIWxcyJAAXQr6/v0Thw+0vID66W8ABb3n
         vm/Q==
X-Gm-Message-State: AOJu0YxnKZtRiz0lWGso+JWfURNY2GFAlmGwj4isVF01af4xyhgonNad
	rP5o1/SHlmGLOI8S7miaWVaqLKSpB381WjHnJ1EE9Q7Ore6GDNXXNHO2IVlvaV96CtiFW/fWRBS
	hXXk5TxGWALXdetsF/RsPQgunBY23YKzKzA==
X-Received: by 2002:a50:9fa2:0:b0:53e:30dc:ef59 with SMTP id c31-20020a509fa2000000b0053e30dcef59mr482572edf.10.1700600439160;
        Tue, 21 Nov 2023 13:00:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwpvMEWX47ncIhBtEbj+j0d5dFP7KXWVjYwYcCXJ1sJG7kN1UT50YIaXBoeLqJVjGyrs06Jg==
X-Received: by 2002:a50:9fa2:0:b0:53e:30dc:ef59 with SMTP id c31-20020a509fa2000000b0053e30dcef59mr482557edf.10.1700600438773;
        Tue, 21 Nov 2023 13:00:38 -0800 (PST)
Date: Tue, 21 Nov 2023 16:00:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231121155805-mutt-send-email-mst@kernel.org>
References: <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
 <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Tue, Nov 21, 2023 at 04:29:36PM +0000, Parav Pandit wrote:
> Basic test with iperf is not working. Crashing it.
> All of this is complete unrelated discussion to this series to slow down the work.
> I don’t see any value.
> Michael asked to do the test, we did, it does not work. Functionally broken code has no comparison.

It's unfortunate it's unstable for you, if you could show perf
comparison that would be a strong argument for your case. Reporting
Linux/qemu failures to virtio TC is not going to help you though, wrong
forum.

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

