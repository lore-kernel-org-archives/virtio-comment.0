Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D422F163
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741622326; cv=none; b=ukg7PLx0MAIblbddC8Elhjt6rR4Ua49l48bcIVyzUbD1qNHgS4E3Izff1uddMg84krxmU3PYTvziEvtCsFAVBWpd2u+ymOSDyXoIshG7GBAzQ5NyjkpPLpqr/PnJiYiz0sdH29M1JVEJNfMgFBv1U6xtoXbyWS6QHTRY2Qa1Huo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741622326; c=relaxed/simple;
	bh=bcargABcgIrkPQWBiY1wCzUswNO+k2Xn/dXsQd7bd+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jG/WABoDLzISEv1NxR/StOhmP06hB0OwC+9b+ll8Gso+e21dOy54NtqP4siVR+slCKcF90fcxHZ/By+646QqpusGs9inmoWCIkjHZzRpxto1YvhIS+V5M1ydQlAIvyxdOjJ4cXWWYl89f84GCw+Zu8bBRhPEtOvAcnJ98RtZfHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OO1hhvSq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OO1hhvSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741622323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWjhXBqkunakbpV0M6TYrfR3UW3rQKszUQsP9shb73w=;
	b=OO1hhvSq1XYZazCb2yRxx3PfO0zWYPIF/zjbo5nNN+Qg+LOkztJip1DAH1MLk7zSlmyokP
	lReZRci+7aTmBFt94zCnm9+KJyQrqwP36nbz+RzymslI3qCQrP5cNrglpdte2A1oZ0OMoO
	zptUYY581NAxEv4XRVjT2HPPGdjgAfA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-zmkn1K99PPmGX-0whQj5MA-1; Mon, 10 Mar 2025 11:58:42 -0400
X-MC-Unique: zmkn1K99PPmGX-0whQj5MA-1
X-Mimecast-MFC-AGG-ID: zmkn1K99PPmGX-0whQj5MA_1741622321
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cec217977so9442495e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 08:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741622321; x=1742227121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWjhXBqkunakbpV0M6TYrfR3UW3rQKszUQsP9shb73w=;
        b=KrbQfwzwXFciqxnLTz3amAutT5iGf4h9CRQ0Ds2UcX2Ko39H9tIc4brOTJtYnw1N3T
         vOcQXlzePBeipCzxinKmZC2+KMqWL3IiDzHlz8ga7lTyvSvR7v1PNl7goivKn4Naetr4
         hjrbYI3/+ChZhAy2H8ez5oGxz5vEPNoJj897FpordWlAIiAyUarwWY+qhTizJuKIhbT4
         bnHYJY32CR8ytM+PeNQ7KzFMamsJycNspHC7UsYrYhOi5fQDbM9f4fC31Iqu7CO8NinS
         V3d8eHoMN1n351APIIhNfeX3GUZB6GX0BrB3Ie9lvhpRjLOQuUTZDrkHMKZvWuiulm6X
         0wpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY3yaO+vKNJGTE4ZOEC+QN026PX6PNsB/3Ws4VsU0hybED2tJZ6g1GZ14DIbSFMr7zZsUvIr8R6CM4fkQDXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgjjR+7pFT62E0e6DHs4INwIjda6I+BBPV4bgoUd8lmCW4r0lr
	ewufIMQqwpPAz/8z+i+vHT3M8fkpZtlNdF3I1U72F92LednaLr16qv+slic3KY9D0UxpHeJXPGt
	2OX/Fky6qsnsvG/sk6tn48Rvvp2sMGDfAzHDFrkhPnaSed0ECdKzei8n98GOfW0x8
X-Gm-Gg: ASbGncsYWtarX+r26VIo/CadfU6Gqcb4xpaqdHeCyPbeIxo5nhdGwo0Wm4pom8SGtGz
	acYkexJaPB0lvAxvVZMj0p3Mw27v7Lm6dngVRRCx2hSGHbp6U/hO1jj+5xw/NqHUk9cq1xg0D+0
	m9lZgxRHvArmQNhgQOKSLWnE3vf5kUUZaahvY2fMVR6/blCMnzrB6Jf4akx/CgNomQ+T7b3zkjJ
	KjgMqO5wpU+SqdBA9SNzIdamGazKNKxgod+yI6C7VtYudBWYWs+Aijpx2eLiKq133SeWmD/iR3Q
	ex9pwamuJQ==
X-Received: by 2002:a05:600c:3ace:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43cefed7884mr40059385e9.28.1741622320919;
        Mon, 10 Mar 2025 08:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJxXevlPKBSPRamimtu4HiU9hFK1hX2gLWh6VpCk6RK/AFpXhi64vcdesxYKBWNEgfac3N2g==
X-Received: by 2002:a05:600c:3ace:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43cefed7884mr40059135e9.28.1741622320612;
        Mon, 10 Mar 2025 08:58:40 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm178534835e9.4.2025.03.10.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:58:40 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:58:38 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v2] README.md: add example email for TC vote request
Message-ID: <Z88MLorN4afEuN/V@fedora>
References: <20250227150241.1274768-1-mvaralar@redhat.com>
 <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <Z8bnpjiYpmiFH7+7@fedora>
 <87h641uihz.fsf@redhat.com>
 <20250310095206-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250310095206-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _gZ9__85KMFhIBXjUArc4Fa_iDQDOfr5_XvC-Q3VP80_1741622321
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 10, 2025 at 09:55:09AM -0400, Michael S. Tsirkin wrote:
> On Mon, Mar 10, 2025 at 02:23:36PM +0100, Cornelia Huck wrote:
> > On Tue, Mar 04 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:
> > 
> > > On Sat, Mar 01, 2025 at 06:08:32AM +0000, Parav Pandit wrote:
> > >> 
> > >> 
> > >> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > >> > Sent: Thursday, February 27, 2025 8:33 PM
> > >> > 
> > >> > Acked-by: Cornelia Huck <cohuck@redhat.com>
> > >> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > >> > ---
> > >> > v1 -> v2: add Subject and To
> > >> > ---
> > >> >  README.md | 11 ++++++++++-
> > >> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >> > 
> > >> > diff --git a/README.md b/README.md
> > >> > index c06caf6..731838b 100644
> > >> > --- a/README.md
> > >> > +++ b/README.md
> > >> > @@ -206,7 +206,16 @@ The mail requesting the vote should include the
> > >> > following, on a line by itself:<  <code>
> > >> >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> > >> >  </code>
> > >> > -(NNN is the issue number)</li>
> > >> > +(NNN is the issue number)<br>
> > >> > +For example, you can use the following template when requesting the TC
> > >> > +vote:<br> <code>
> > >> > +Subject: PATCH [description of changes]<br>
> 
> No this is wrong. It is
> 
> Subject: [PATCH] <description of changes>
> 
> or if you want to be more specific:
> 
> Subject: [PATCH v<version>] <spec area>:<description of changes>
> 
> 

The `<` and `>` characters are not correctly parsed by the markdown
editor. I will replace them with `&lt;` and `&gt;` in v3.

Matias

