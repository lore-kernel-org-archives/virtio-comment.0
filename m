Return-Path: <virtio-comment-return-6317-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E95CC77B7A
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:46:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 32F4D71C8B
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:46:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14C9C98657E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:46:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF5DC9842EA; Tue, 13 Jun 2023 07:46:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA1C398653E
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 07:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SttmmYEtOy6oDQffBmcHIA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642394; x=1689234394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG7SCf0RQfX6ymVn4iEhNzZEqE2ce5aO4edq59XIeAM=;
        b=TM/OGwqhcOl0k+0ayuYqBmY7QiHwofpvIIKBc+jUo1ChX5LpQEQjakTLGyqSIjeOWV
         9yGt/fxTmVw2Ff0coNtC7OvxisDWfmTm/ZSv+RI+xKRZvfJUuNQxwRgcmsZH8WKpaNhg
         O8G4wIoi5WKM8E3KUka8KL0GcXlmHiIp97XcwHHd39UGwf2Au7U6NCUKCjNHXAOzrjvp
         M2YmwUgjNGIgCfkg8vyvaF5a/uJh2ibrCVL/WqEHC5KQqkk5HZcc2B3xQG9WhbWPFhci
         0XQFKDYAfu7VmUFHZq9Hy/A5W4KibDfSiF+IF4hCQh0wNTHhEOps8IB+Gxzmg9s3ngXi
         5qLw==
X-Gm-Message-State: AC+VfDzOxdsaLZIerY4xrJqlokVKu5GmHS8G2nzFUl0Q5kJCLNYJuQl5
	6b9z/vYg/L/qTPJbjyGvS1v+7D0jmHclwE+yrapNqJxAEV1kXM95jmpRpHG90pQzrSn5U/5wflg
	6t3HSAEIrKhVpftLcIM8cXOQTCYSyUZye0w==
X-Received: by 2002:ac8:58c3:0:b0:3f8:35e7:d0c6 with SMTP id u3-20020ac858c3000000b003f835e7d0c6mr18528287qta.30.1686642394562;
        Tue, 13 Jun 2023 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5/Lz/SAqZQInLf0CA3CPgdgsMBvooXEnGwaDLn84MHlH40tAgAEHhjSp55J374ofxx6kk4Mw==
X-Received: by 2002:ac8:58c3:0:b0:3f8:35e7:d0c6 with SMTP id u3-20020ac858c3000000b003f835e7d0c6mr18528267qta.30.1686642394304;
        Tue, 13 Jun 2023 00:46:34 -0700 (PDT)
Date: Tue, 13 Jun 2023 03:46:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230613034216-mutt-send-email-mst@kernel.org>
References: <20230607162529-mutt-send-email-mst@kernel.org>
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez Martin wrote:
> > > Another drawback of that is the long time a device can spend to
> > > reconfigure its memory maps.
> >
> > The map is already used for cvq though, I don't see why it would take
> > much more with this.
> >
> 
> In the case of vDPA HW, CVQ maps may not need to reach the device's or
> platform IOMMU, so the modification of that mapping is way cheaper.

Oh, I get it. It's setup time, but you are right.

> > > taking that into account, does it make
> > > sense to send a new version with the bit 1 on enable?
> > >
> > > Thanks!
> >
> > Current hardware won't support the extra bit though.

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

