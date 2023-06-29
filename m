Return-Path: <virtio-comment-return-6601-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C16EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 07:07:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8FC2B15AA24
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 07:07:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A1659866E6
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 07:07:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 808B0986590; Thu, 29 Jun 2023 07:07:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D6B49865A8
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jun 2023 07:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: PHhSSwfwNhS0xtvP_ssuyQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688022433; x=1690614433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNizIK8kauGtncuBxmot7fuS9Aqv+C+YOlo+k9Id4+A=;
        b=BfoI003RxuC6kvh9UA49ArcmleiiOouRjXZiaUNhsdca3jf/iQkKTozurHys4bmUmW
         /P78Lx3aTBsFOBY+D3kumSpwxDqn2BYoTsZXAntbRphTpm3Vva/Sv3cvN0gYggG8VEOI
         LBN5hzA8R4UXR9ihW7DJhaRxElxStujqttxb0QePrGPhn6+rUUsFSNC6YFjl0soKdGbj
         t25QYhylv/4d/bqjhX9uDMJzrPYzySJrRUOj411qG/JQSvaG4DWv+RD8SuEA9sN7iKfv
         Rw8g5vz+ARCRg951sBhWEjmdt02scEpN9IKid20ecB1B9oyvXFEybbYMQYA/HqBb3BwJ
         ZhbQ==
X-Gm-Message-State: AC+VfDzuXmi6ohDeShZdULLNmsg9lY+cnLZ/VpoM0w6YRIDKUrlite6B
	LV5+X2SahqgIyUdGXwlYqCJtgDc0zANvXkkb/vxi28WFJ+ptL5Q7dLoUfHxnBfjdLI9Or6L86Xk
	WNBa2vo3Pi/++fkrK7ahudUopBn1dVF3ncw==
X-Received: by 2002:a05:600c:28c:b0:3fb:2d92:ecf1 with SMTP id 12-20020a05600c028c00b003fb2d92ecf1mr3301662wmk.7.1688022432891;
        Thu, 29 Jun 2023 00:07:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75r+i15bn91Izq0emlEYhr/YrsdTiII7j8lNvHpBOtV6E9Ze4OsAtrD2QOOeKE8ZH29nwRDQ==
X-Received: by 2002:a05:600c:28c:b0:3fb:2d92:ecf1 with SMTP id 12-20020a05600c028c00b003fb2d92ecf1mr3301643wmk.7.1688022432518;
        Thu, 29 Jun 2023 00:07:12 -0700 (PDT)
Date: Thu, 29 Jun 2023 03:07:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230629030345-mutt-send-email-mst@kernel.org>
References: <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
 <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628061257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481ED6C94DE8CC414C3369BDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628123131-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BA1CDA0942170186CB59DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628132122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814D42786A6981467D3FADDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628152125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EAD97F6163C52DF4FF53DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481EAD97F6163C52DF4FF53DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v19] virtio-net: support inner
 header hash

On Thu, Jun 29, 2023 at 01:56:34AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 28, 2023 3:45 PM
> > > > Maybe I get it. You want to use the new features as a carrot to
> > > > force drivers to implement DMA? You suspect they will ignore the
> > > > spec requirement just because things seem to work?
> > > >
> > > Right because it is not a must normative.
> > 
> > Well SHOULD also does not mean "ok to just ignore".
> > 
> > 	This word, or the adjective "RECOMMENDED", mean that there
> > 	   may exist valid reasons in particular circumstances to ignore a
> > 	   particular item, but the full implications must be understood and
> > 	   carefully weighed before choosing a different course.
> >
> RECOMMENDED and SHOULD forces the device to support MMIO, which is not good.

You said this already. Let's not repeat ourselves please.

It's a single word. We need to work on a patch, we can argue about
small detail once it's posted. It's not in your list of plans so
I am guessing we need someone on Red Hat side to work on this?

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

