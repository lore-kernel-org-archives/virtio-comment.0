Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377733991
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741614919; cv=none; b=WtUMKRdzzuhgHmpH+pNJdSp1QeizbmiOZQyFrrYn000hupeFms2zx/hHZ6YUwLIJMCkQi/gs2PxKFiQ9/baqWo2/Qp53WWKVVWqJJypxITdT+mmAbaq6Apu3iABZuaq22CsXx3PEd9WDg/zUiVv82rfVZaUL82pgodHCd3nWjk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741614919; c=relaxed/simple;
	bh=NHl46FEAJsANMDWG3mAWaNEmWHAzGugCin0YXke1Flk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Y6hXQv9MMlzEB0y9V4/5q5HLtuI9BMUGf2nekg9LlORGGX3MCdlszNvwWXpysT2vc7SWH2rr7ejqbpYAek6aFONjTMb7wuZbojRQw+gmhHjOw+vaA3CoFjHMdCgyVyLjdDl5g+ZYAJaE4BFAvsiw8Aet7CpiufuCXBicyeGwf44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQFp/47i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQFp/47i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741614916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HjLdHvV8smer5V+omiLKjm5duSVmI74YE6vtlbYq/1c=;
	b=WQFp/47iRE1OLl+KN7kC+eZYqaCExY/o+krIrfNqvwfkXuWaShz/fgZl+IppfdaR4aHTEt
	uS5g0NPX0KBf6apOPJha9UctQ1bNYaqVNiEOMBhOYEoqCEj1GvVdDVrvwrZyyCTh1kB9k6
	U05KgnD2vL6Ng/qoV4lcM1xY9VGWNJQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-LZx80sfQOkOioFVpMIQluA-1; Mon, 10 Mar 2025 09:55:15 -0400
X-MC-Unique: LZx80sfQOkOioFVpMIQluA-1
X-Mimecast-MFC-AGG-ID: LZx80sfQOkOioFVpMIQluA_1741614914
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-438da39bb69so29225595e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 06:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741614914; x=1742219714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjLdHvV8smer5V+omiLKjm5duSVmI74YE6vtlbYq/1c=;
        b=jiY5wKO25X08943nhOfBWoqmi/xfIKmVCGGaMuSb0GQ0nDYA3zJX52okIhiURaIey1
         qvYMSQtPxmGTrwJYoxR2cDVrNPNrceiEnr0+TeN+AG7ST+jU9dlrcn75rtrV63Qxjxec
         OKcTtAarTzevBA5fG6J5CJ+R1idtuwpNJhMRQNpGDvn2URpDRRiz0ehQhCSnVSSXibns
         LcOGCecftMMjg6+cYHeQez4x9n+EPLXm0xHrdfZydrWx1KsaO1nXcDagyM0M/tx7y+nP
         VmUqlTve0QxwIt3AF9buit0/rQiNUV18QOjiZ1G2wOmhcGX6KXKdHd8cBF3peW2h4hy9
         U2pw==
X-Forwarded-Encrypted: i=1; AJvYcCXGyBDJfYQ2Jxawbdfx0PX4yMik2kOBfK0PCz4B4KTU7Lm2NGpg6SPUDhBS2rpJml+DHFsJKtszHtg5peQ/KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2DqkMSZ4dt3NraL63cyBO7ZjVFmfEguGVBxFnqAXSMspp+arZ
	VWFp7EjpCAcH3szrUU7X/qSguK/lLMmvkRPHhqXTwFIDUx0S+6BJcujIipph0DVu+bApZ/CC5RP
	cHuDKZ7NnUhPzSiVoYWjn1UE+9VIAiHHJoXT+RwtWK/X079r40pgJf9SJIi7HOzaW
X-Gm-Gg: ASbGncv49dtqWES1Q0r9vFquileByHIVONcA/gauFBK/hdOjl2LlNI5zV4LgDyKYAOT
	j7JcKd6rS7g3YpJ7lLA4tEFHE9+j3fM3MN6U4QXYI94tpQgyqwPcM4iwSrepihAsIdzYosbEMrA
	Gg2jbNqdBot4vXb9nh0sutd1AaclTlww9BHxHm4+LYftDdf6UEc/Kjsw+VGtqyWpe5jtH+Fpx4K
	2iNLMQciTuFBfZGlLj//DTkPN5gFT4PqfZYmrcTtcI/Os/Z+9AGFRiNvaeRJeCCrSE21ipFO8JC
	zJMVpV16lA==
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43cfceb0aedmr19425935e9.11.1741614913787;
        Mon, 10 Mar 2025 06:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4N1GZdWSlDe3b00XeAlLQT2mJPBGZxOx+Egw6WTh0+tnNn8RJkK5JorBdsS4irOIRZsSl6A==
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43cfceb0aedmr19425515e9.11.1741614913416;
        Mon, 10 Mar 2025 06:55:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf1b36d14sm52260605e9.37.2025.03.10.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:55:12 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:55:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v2] README.md: add example email for TC vote request
Message-ID: <20250310095206-mutt-send-email-mst@kernel.org>
References: <20250227150241.1274768-1-mvaralar@redhat.com>
 <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <Z8bnpjiYpmiFH7+7@fedora>
 <87h641uihz.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87h641uihz.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _ndgTvFaJuR_FpR6XtDpSy5hUMVLw7B5ubdWjCG1yWo_1741614914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 10, 2025 at 02:23:36PM +0100, Cornelia Huck wrote:
> On Tue, Mar 04 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:
> 
> > On Sat, Mar 01, 2025 at 06:08:32AM +0000, Parav Pandit wrote:
> >> 
> >> 
> >> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >> > Sent: Thursday, February 27, 2025 8:33 PM
> >> > 
> >> > Acked-by: Cornelia Huck <cohuck@redhat.com>
> >> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >> > ---
> >> > v1 -> v2: add Subject and To
> >> > ---
> >> >  README.md | 11 ++++++++++-
> >> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >> > 
> >> > diff --git a/README.md b/README.md
> >> > index c06caf6..731838b 100644
> >> > --- a/README.md
> >> > +++ b/README.md
> >> > @@ -206,7 +206,16 @@ The mail requesting the vote should include the
> >> > following, on a line by itself:<  <code>
> >> >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> >> >  </code>
> >> > -(NNN is the issue number)</li>
> >> > +(NNN is the issue number)<br>
> >> > +For example, you can use the following template when requesting the TC
> >> > +vote:<br> <code>
> >> > +Subject: PATCH [description of changes]<br>

No this is wrong. It is

Subject: [PATCH] <description of changes>

or if you want to be more specific:

Subject: [PATCH v<version>] <spec area>:<description of changes>




> >> > +To: virtio-comment@lists.linux.dev<br>
> >> > +
> >> > +Could please open a voting ballot for these changes?
> >> > +
> >> > +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> >> > +</code></li>
> >> >  <li>Please make sure to allow time for review between posting a comment
> >> > and asking for a vote. </li>  </ol>
> >> > 
> >> > base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> >> > --
> >> > 2.42.0
> >> Reviewed-by: Parav Pandit <parav@nvidia.com>
> >> 
> >
> > Could please open a voting ballot for these changes?
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/219 
> >
> > Thanks, Matias.
> 
> We can do this via a ballot; I'd also be fine doing this as an editorial
> update.

It's not part of the spec - can not be "editorial".
If the change was a change in the bylaws, we'd need a vote.
But it's just a clarification, no need to vote.
Let's get some acks, though.

-- 
MST

