Return-Path: <virtio-comment-return-6856-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464A2EB64DD
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B0CD7370E7
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7E2C9867C8
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E0169867C1; Thu, 13 Jul 2023 11:01:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C3D99867C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jul 2023 11:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vTCTZUhhPIGEkiCIdEM_qQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246114; x=1691838114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/2rOdO9cTUlIlJb4UuutOjnx2Ih/MqS4USnMwRvZNg=;
        b=AE6XIAyKgj5cPL6RZpqxIVwX/a+YG3zCF4oryRBzQaIRA3I3Y1HjB5JQiNqZZVLE96
         iklXgL/3lI7cuQSKB9tSQkQcBl54L39Ijavd8v4ee+QG+bHMKUAfE+CDRcwhnT8tEGQR
         yUVP292ZoFO3PAJXx8z762ysHA1EeqA6TWyMwjnCHQJMpfS0Uu1TLn28GuD3kBUSf1tk
         h8V7dzcgvqVBRCxJIYZVlVgJN/59l+oRi7VlWCKz7ORPMokSQeEDAo6WQYKMnLcweikG
         0koKKI1qVmugJP0jrAuFQqXSAOlDfMGNx9QuiWuHlr1AZyn7OQCwn4WTWtsJqBnBCYTc
         81yQ==
X-Gm-Message-State: ABy/qLbhkgR45H22BgU9AmYL3Qwkj0dnJfjTEauGT4JG46FOv8goTi2i
	qr0DHTJAr53kYo1G+/DU8txTpkAs2FA8Lc00oYiIJ22f10jlnb/HnfWu/9u++jUZV7slGSE8Irn
	RKnpl9Y3ox+kfmh5OlqfRPitJ+jUTX5iP6Q==
X-Received: by 2002:adf:f84d:0:b0:315:ac1b:91e with SMTP id d13-20020adff84d000000b00315ac1b091emr1094466wrq.53.1689246114712;
        Thu, 13 Jul 2023 04:01:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEkz1t4DikSuMFNBFgXuJ+iUTmPjNpy6iwhNoGSbstd0EJ10VAIzGHhEtmn4B5cqPpqLzChVQ==
X-Received: by 2002:adf:f84d:0:b0:315:ac1b:91e with SMTP id d13-20020adff84d000000b00315ac1b091emr1094452wrq.53.1689246114448;
        Thu, 13 Jul 2023 04:01:54 -0700 (PDT)
Date: Thu, 13 Jul 2023 07:01:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230713070130-mutt-send-email-mst@kernel.org>
References: <20230712222405.455201-1-parav@nvidia.com>
 <20230712222405.455201-4-parav@nvidia.com>
 <20230712184051-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481634F6AA8E6553D5D0463DC36A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87351ss050.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87351ss050.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 3/4] virtio-net: Use table to describe inner hash to rfc
 mapping

On Thu, Jul 13, 2023 at 10:09:47AM +0200, Cornelia Huck wrote:
> On Wed, Jul 12 2023, Parav Pandit <parav@nvidia.com> wrote:
> 
> >> From: Michael S. Tsirkin <mst@redhat.com>
> >> Sent: Wednesday, July 12, 2023 6:41 PM
> >> Hmm. escapechar did not work then?
> >
> >  Forgot to mention, I tried it, it didn't work.
> 
> It seemed to work for me (at least in the pdf) -- I'd prefer that one as
> a minimal change.

Yes it really should.  Could you post yours please?


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

