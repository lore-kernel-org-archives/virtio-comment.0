Return-Path: <virtio-comment-return-6448-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F3EB64D7
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:16:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C27E042C29
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:16:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A45C19865D1
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:16:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 93EB2983DDB; Wed, 21 Jun 2023 20:16:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D7E19865CE
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 20:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 54NqtnVRNWabKwlc2EPcrQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687378604; x=1689970604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDd2HAAraecmTTS7+CAYLdh14y7aVFdbcLiVqDYah+k=;
        b=Ev9LD4BimMYwYWIJq1oNiRHpD0Xnnyk1Oyy9AzMeSYSFgrrTI9uLELJzI503/0GCVU
         UZFmiC1kiUqDlkWFRXoMC3/vuvAnSQin7pBfVqmH6XVJFAlhToSO6Pilxr1zio70t9Jp
         XIbsoe9dqjDkR8OjsuKb9CxOyauj5x6v+ui+ad0EIElhiyJUwsuDn7iFEZL3NqsWEsrU
         50zd01TSfEBr5H5BDg47qxsQwRMLdm/f6RVnIlTB5UanL7WBOxTfBgi+07VY++LsFxqL
         2nQGk27YYNuCdfe2TzZLa1AphQRWZVnTMwP6JvMZJ1Pz6rotVgRR5jxLzXzeOgmJfcSV
         nNVQ==
X-Gm-Message-State: AC+VfDzWIYH2Akz6/G4YfAxjljzB1L2A4V0/QyBLI0eVpEoeVy7/GOEq
	bfLbZ6cH/2Uo6V+J1UaqOsbh6wMpVS4DorEEPgB/ZEPyHkYx4lhweVXPiTM12UOO9Q3l9ZrD67L
	gme7+72siQMHlWGlwnjygiZCHrynw98PBOQ==
X-Received: by 2002:aa7:d1c9:0:b0:51a:3204:fb09 with SMTP id g9-20020aa7d1c9000000b0051a3204fb09mr4165156edp.26.1687378604181;
        Wed, 21 Jun 2023 13:16:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sftoWnYTAa7mnd9yOkSqVxniLfViWaRDNpaaDT4P4T9lAI8LYI1FF+GR9tWxc3qUZ0kQyPg==
X-Received: by 2002:aa7:d1c9:0:b0:51a:3204:fb09 with SMTP id g9-20020aa7d1c9000000b0051a3204fb09mr4165151edp.26.1687378603926;
        Wed, 21 Jun 2023 13:16:43 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:16:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230621161157-mutt-send-email-mst@kernel.org>
References: <20230621135052.76028-1-hengqi@linux.alibaba.com>
 <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <20230621152559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Wed, Jun 21, 2023 at 07:37:00PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 21, 2023 3:32 PM
> 
> > 
> > Well RSS is designed (imho) better since it keeps the supported types in config
> > space. Doing it here would have removed the need for GET command.
> > Yes I know Parav hates config space, no I don't think for a read-only field like
> > this one this hate is justified.
> > Did we discuss this and decided not to add it in config space for some reason? I
> > don't remember ...
> > 
> Yes, we discussed this in v12 or before to have symmetric interface to have it via get and set via cvq.
> Should be there in the change log.

Oh good point, it is in commit log. Heng Qi, thanks for writing such a
nice detailed commit log!

Here is what you wrote:
	Given that a set command is added via cvq, it make sense to also do 
	symetrric work to get it via a cvq.

and actually I missed the fact that instead of making this
symmetric it forced separate structures for GET and SET.

If we move supported_tunnel_hash_types back to config space
then GET and SET just need the active bitmap. *that* seems
symmetric to me.

And the field is RO so no memory cost to exposing it in all VFs.


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

