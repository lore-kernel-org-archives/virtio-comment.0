Return-Path: <virtio-comment-return-6689-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86979EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 13:05:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3A99190906
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 13:05:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFD1A986555
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 13:05:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9AC19986460; Mon,  3 Jul 2023 13:05:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1838986471
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 13:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Z45Mu1CeMVKF3M8kZm381g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389514; x=1690981514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt+s6ntXssEcTiQRfRJuhYczSHatrT5hzCfz5p+/byQ=;
        b=bb1hFmxMJpX6/RGbejIDKlbJBy2xQQzD7vMoUPn8YBhke2gIYeqfFXONSzaScx6uxw
         ZGj1tz/Uucpif8C5u1Pg3CSa6mQjqLgH5VDVTCuBJaVRsTz2hoZfEMp9y6jtDclGR1do
         Uy62DxxTSi5NGVqcEmSt6SZHWTqcpyiCniD3utaDrswB74/8hB0yj2XjDlkoOVCTI/wA
         xQv2Mf1kRFO+Oc7O4y7FSi1kzN8gNHaFy0XsPp9KeX8349GegOAKgrQUlqI2/a5OQ/H+
         wLesZF3aI8bZ3iMlwZryV9sb9TJyZfNzUXPIAftadUP0QrFSJMZjyhQ/3rpkeVMb1FCP
         slYg==
X-Gm-Message-State: ABy/qLZgj1ekdKfvH2hRvhLGtAgctYaZgkqfpItf9I4VyYj374cmP+qQ
	rPEITF7i8nnH9mOoTAkkeHznBpJJTulQGBH+xrMLx1zR5YVg+PYa6XY08HxsEOiGGCnalj4NwO8
	DA3wCxnqgg/VAUstfk/M7rvZ3+MqAvx8Cjg==
X-Received: by 2002:adf:ee02:0:b0:314:21eb:73f5 with SMTP id y2-20020adfee02000000b0031421eb73f5mr7947564wrn.16.1688389513825;
        Mon, 03 Jul 2023 06:05:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHIjekiyymVrs3ByhP7LhfZSMZ+6uotn8UHyvWSoPV/2w20pZCBLbBF4NPDaM3vOHAbyabGsw==
X-Received: by 2002:adf:ee02:0:b0:314:21eb:73f5 with SMTP id y2-20020adfee02000000b0031421eb73f5mr7947550wrn.16.1688389513533;
        Mon, 03 Jul 2023 06:05:13 -0700 (PDT)
Date: Mon, 3 Jul 2023 09:05:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	virtio-comment@lists.oasis-open.org, parav@nvidia.com
Message-ID: <20230703071106-mutt-send-email-mst@kernel.org>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] About the plan of Admin Queue

OK it looks like at least Parav and Jason understand what's
going on, maybe one of you can explain:

1- there's a management stack that can bind an ID
  to a group of properties
2- the proposed command then binds an ID to a VF
3- after this, VF can be assigned to a VM

Is this a fair summary?

In that case what is gained compared to
configuring properties on the VF directly?
Why is not the ID an internal property of the management?

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

