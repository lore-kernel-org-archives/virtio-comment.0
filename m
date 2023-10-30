Return-Path: <virtio-comment-return-8036-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E1EC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:12:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DE6A12AEDD
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:12:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BDC4C986B2B
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:12:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A2B9F986B29; Mon, 30 Oct 2023 11:12:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91E27986B2A
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 11:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sPn63piRNpea6uc-R66aUw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698664316; x=1699269116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvwuiY/yibISTE2VvEnfszoRALpCfjgsjDKMIT0iG3E=;
        b=oIeGdRQOjZ60+BMDcUk5YAVubWoou2MIAyojPhQ+SRbgeivBTkCkLnEXQlWN2bSum5
         ZiKI6kMlqn4ORh2RotoF4Di9V1z/GhseKh5EPJYoix6MMChQPurEQ5a8nobTlVPfkRdS
         gevxSIe2fBRMEZrJbB66zNDu7Ks/1/L2LlrjIOnZ3z+RCWsq+muX6hDvUl8dR/HHDaE/
         p4zVA/8wLeYf9PmCR1U5b9ACOwg3UqWWoAYEAmUvWfQZCVbyS4pPwwQgr8lGo6qrAddO
         a7BwiBPEOn7YetqQcovqNm2yn0rMJw+1HzCA3kja8VZCQcKh2cxBgOXAWyhLajT7SGaV
         Kr4A==
X-Gm-Message-State: AOJu0YywxSJ6ij0Z9MdcKucZ6CAPoh+qOAvL5FO9y10r4BCfWJyxOByp
	hBMVhkwzaKl1YV6Ru2xfn2rmqvL+M5CGlp1lqFt3zq9LLWIuNSkR1aB/ArwZVGTZhOf6KDPD8tp
	ql/7Lx8Pn3saN9kRb1t4a6oNOu48hoHpiI/Q+6mvhCw==
X-Received: by 2002:a05:6512:3e0a:b0:507:b15b:8b93 with SMTP id i10-20020a0565123e0a00b00507b15b8b93mr8432088lfv.69.1698664316367;
        Mon, 30 Oct 2023 04:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExd95kJhV//mxsfQUcgYqVmHYPepZQjRgmd8vwzqyhAzjlql2imoQOKQgmk8GL9QUZWYM2ag==
X-Received: by 2002:a05:6512:3e0a:b0:507:b15b:8b93 with SMTP id i10-20020a0565123e0a00b00507b15b8b93mr8432068lfv.69.1698664316026;
        Mon, 30 Oct 2023 04:11:56 -0700 (PDT)
Date: Mon, 30 Oct 2023 07:11:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Message-ID: <20231030071109-mutt-send-email-mst@kernel.org>
References: <20231027133236.1350124-1-parav@nvidia.com>
 <PH0PR12MB54810FFF99577FB6B7FEA51BDCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231027102358-mutt-send-email-mst@kernel.org>
 <87bkckrva2.fsf@redhat.com>
 <87wmv4qsqf.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87wmv4qsqf.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH] conformance: Add missing virtqueue
 reset conformance references

On Mon, Oct 30, 2023 at 12:01:28PM +0100, Cornelia Huck wrote:
> On Fri, Oct 27 2023, Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Fri, Oct 27 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> I think we can merge it as editorial actually. Cornelia?
> >
> > I agree. (Someone should probably merge the voted issues on the 1.4
> > branch first.)
> 
> But what I'll do is removing the "Fixes:" line and close the github
> issue manually. We should use github issues for voting only, not for
> editorial changes (we need some way to distinguish between the two, and
> I'd rather have a straightforward way to do so.)

Agree totally, that seems like the best way to do it.
If this begins to happen a lot we can add an "editorial" tag though.


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

