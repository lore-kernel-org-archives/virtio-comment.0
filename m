Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FEB23816C
	for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741770598; cv=none; b=e9eatFFAwDYipF8o8MMtHlj/x9bASNWc+uNQZR0JJUNJLNktEo+mg1FWJYHipMaQOlpV2zcJNsiQ5tfo+ysqeoOcwwsqsJWZc+EI4QABTJkxeuHB8JRxhwK3O1tbxchS+LADUTvlYAyFkF3jkTu2WaIaS5+ZbH9R2M52J2g/mig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741770598; c=relaxed/simple;
	bh=T2Mh/vjSdsHNTwt4QSU3MpulENYR0Db6YPZ7G3sqrLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=G8wcY+/bi2VCi4kiYIgJsLS0jwFZuMat0g51Srabm73SdKfkdQnfbqVZ7sAuZHAeYEUqNhchB7ApK3hMwb2EKe2r6kfhkGIyZe0FmukjkY7Pd1I2vvjVyf/K3KxWdkyFE5rAojcO9kEWq0ZwBskqaXXU1Ha4pbQnMjRHm2RhZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvY4Tksu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvY4Tksu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741770595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n/ys0qFUv0bELp/pwVf19sCfPCYuYd+3wuAA0OIu9W8=;
	b=dvY4TksuivJjIYLIK/KHFVAQ2CQidH4QJXdOiyJtN4D8mqWqS5oZAkXQRXMt9UfBIiLRJw
	3go6VGT/3jdLyiGzHw+U98f5QXxNLun4LAo2WNv05k7ZWW1WbU7Gy25lVorPqAIZdmK3DT
	3NECzBEFF96VSs+jqAL9fdPXKum01ZY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-Os_9jfMiPUqY1sEn1K_bNA-1; Wed, 12 Mar 2025 05:09:53 -0400
X-MC-Unique: Os_9jfMiPUqY1sEn1K_bNA-1
X-Mimecast-MFC-AGG-ID: Os_9jfMiPUqY1sEn1K_bNA_1741770592
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fe32b08so3485787f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 02:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741770592; x=1742375392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/ys0qFUv0bELp/pwVf19sCfPCYuYd+3wuAA0OIu9W8=;
        b=donaPJ6MS7+9iwXken+PrzzFei/CJhaEsMJiTQYYHo6nnSen6Rrlv2HC31tR9dy6nT
         L6gQfWQ41pHEKnQmexPLybqwTYK+Q0Hez68d/5mNrMDNtyMwQ3fAv59s7k1grsYTIQBE
         KTnjwU7Xi984C+BcVKAGL1t2d0tX4qsZDXgSQLSrBqhq3UvayOMFxnvYr8yFsWK8G4mt
         MyFOLFLWcim/UV7zgF5SGAcuSiPsWNcmfuHffNHEz+I7GlAOyoIgcDy8rhPS0DQofi8B
         1OFAEWU/X6aGRP87FPsnoOYiRV01kxJTH+EHTCDBKS3qlKmWqwkc7WPbSKiqo6wBsqfB
         PrQA==
X-Gm-Message-State: AOJu0YxdsGh4VF8BWc2gQq3TWpbPj5KBZZ/UaaBO3h90G2WhQRUQZIlc
	E81hx/9BBef5JoDT2Z4XCPFC1iqmnGmzfHN8whpglglFD9HPXp0whRK8NXtETVITI48FfA8yA25
	qMad5zy33/DUJ80D+DHYcBXOMlyw5B3dQIZNMDQJILNxBBYlc96qfxU/vQkeZsS/X
X-Gm-Gg: ASbGncvrXZEzgmOimEV4RPfnDWbninn62cMHPJKC19iO9rROD/nIUeCoHhXL3iTWCmT
	hx55hzQ0JK/wXOX8+TOEcKC95LH9/DndeXMx5tjlL3MI23RiQaSfpOdDyNn7TCA6AT4d+9jiTsL
	ETmU+g+648uqPqdonmZtuUm9LG/MeoBsgddfHTp6TgdglMgeZqGCzqVp6+1kHfK0DsBCIEbW/bo
	BTn1LhCwyvVTVTSI5JB/IzS8k9GDv0A/cB9UbM9rNazyxBS+ygbuZ3tJ8UxaE8tfVSt1kjPpfXy
	C/Vw24NEIQ==
X-Received: by 2002:a5d:59a4:0:b0:391:20ef:6300 with SMTP id ffacd0b85a97d-3926bfe072bmr7913317f8f.37.1741770592194;
        Wed, 12 Mar 2025 02:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/UuLQgQd94MOnShchfUEOnHnwyIHGZ21c7AFXLbtmRgyIpV4qScXstHZyW6PXB3jc8Autkg==
X-Received: by 2002:a5d:59a4:0:b0:391:20ef:6300 with SMTP id ffacd0b85a97d-3926bfe072bmr7913304f8f.37.1741770591859;
        Wed, 12 Mar 2025 02:09:51 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8d068esm14550775e9.33.2025.03.12.02.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:09:51 -0700 (PDT)
Date: Wed, 12 Mar 2025 10:09:49 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, parav@nvidia.com
Subject: Re: [PATCH v4] README.md: add example email for TC vote request
Message-ID: <Z9FPXdEPneX0azfg@fedora>
References: <20250311212030.1745812-1-mvaralar@redhat.com>
 <20250311180828-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250311180828-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zr0gkHvgu5Lv-0LZPvNe3ystpXU2BkVK-tH0d7-CrJg_1741770592
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 06:09:36PM -0400, Michael S. Tsirkin wrote:
> On Tue, Mar 11, 2025 at 10:20:30PM +0100, Matias Ezequiel Vara Larsen wrote:
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v3 -> v4: add "[]"
> > v2 -> v3: use "()"
> > v1 -> v2: add Subject and To
> > ---
> >  README.md | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/README.md b/README.md
> > index c06caf6..f4b32ab 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -206,7 +206,16 @@ The mail requesting the vote should include the following, on a line by itself:<
> >  <code>
> >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> >  </code>
> > -(NNN is the issue number)</li>
> > +(NNN is the issue number)<br>
> > +For example, you can use the following template when requesting the TC vote:<br>
> > +<code>
> > +Subject: [PATCH] (description of changes)<br>
> 
> Wait wait, this should be in response to the patch, no?
> 
> Subject: Re: [PATCH] (description of changes)<br>
> In-Reply-To: (message id of the patch)
> 
> 

The patch introduces a template to ensure that when requesting to open a
ballot, people include in the message both the GitHub issue link and the
request itself. Do you think Subject and In-Reply-To are important in
this context?

Matias

