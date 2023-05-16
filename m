Return-Path: <virtio-comment-return-5936-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E822BC7EE24
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 06:21:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0E72C603C4
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 06:21:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3A67986520
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 06:21:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E5679983E4A; Tue, 16 May 2023 06:21:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D34DD986511
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 06:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gl5tAHXNNtieQ9iCpTav5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684218107; x=1686810107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFOAplc0S947rXVYa74IsCpNcMaan1JD4eLmYno8KpQ=;
        b=lU1qNbeyAE/B+G8kPZedqkNnpEF4dmtVxMvzgNjYUr0CjjfXTOhIabl/w/BqFHAGrv
         +ubp6bJx4zpPWYFntinVELiK0OJ8rGWjXB7FVA7a0VRcAde8y8ZUh5ZZR730WhR2EtdD
         gm+eFs2oaZwZznz1F7STSdvFR/2mmKoGIq9TPEuxZsPHVmc+btD6OmRegyrGX+QbExnf
         +K/J+U32hvtrGqnCeKMdOjhC9r+ocaBOZyMrKZVT7xQjojnoPZTiQSixVo65Kf5E7MLA
         5jrGByB8YBj3FBD5XDRHlNOaAVV15pGEwbTQUNsBEzVTw2HRfpMQcZ9R974fvaujd6Gn
         hGPg==
X-Gm-Message-State: AC+VfDyxdIIttYVtlSdKpwf1VQH10nKL7OkmHq40QnRlfJmbJNw+l2s8
	kmIoltur9Lts/nt5e8WsLsTFHpp5uaOw8OmvRJzWzLA7RDOm4i9rtB9t+qAfh3+vu4E2j8NOFhv
	k+iK0oe5Ouflh4Gum+kdtyz9YMN10gZz5Xw==
X-Received: by 2002:adf:fd4c:0:b0:306:2c47:9736 with SMTP id h12-20020adffd4c000000b003062c479736mr24709193wrs.15.1684218107641;
        Mon, 15 May 2023 23:21:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ZfHN8eAcNqnZimRhMMblg/jLpLjWTcvUyZReGwArylElpV7scC0cZVxy9AQUb/pYEpcYI4A==
X-Received: by 2002:adf:fd4c:0:b0:306:2c47:9736 with SMTP id h12-20020adffd4c000000b003062c479736mr24709177wrs.15.1684218107320;
        Mon, 15 May 2023 23:21:47 -0700 (PDT)
Date: Tue, 16 May 2023 02:21:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230516021401-mutt-send-email-mst@kernel.org>
References: <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <20230511085205-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
 <PH0PR12MB548136C3582B9DE232AEFDE5DC789@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548136C3582B9DE232AEFDE5DC789@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Mon, May 15, 2023 at 03:59:41PM +0000, Parav Pandit wrote:
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, May 15, 2023 3:31 AM
> 
> > > What do we gain from bisecting it?
> > 
> > 
> > 1) No need to deal with the offset in the hardware
> > 
> In context of legacy is doesn’t matter much given that its over AQ.

Let me give you an example. I feel that device specific
config should allow arbitrary length accesses so that e.g.
mac can be read and written atomically.

On the other hand, this is not the case for common config.

I feel we do not need to allow e.g. access to both common config
and device specific one in a single operation, that is
just messy. Now sure, we can add text with an explanation,
but if instead there's a flag saying "this is common cfg"
or "this is device cfg" then it fall out automatically.

Is this a deal breaker? No, but note how neither I nor Jason did not
think about this ahead of the time and the correct usage just falls out
of the interface automatically.  This is a mark of a good interface
design. Lots of corner cases that one has to be careful around is not.

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

