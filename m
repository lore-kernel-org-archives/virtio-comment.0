Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736222E412
	for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778629; cv=none; b=HYU0PEI1yDUkXjkcKJnvgkjfJxyetAMJUCOjpQOom/UjU7okPXqYW/ByuPQwbDk+FQSAhTquMUsXSddPSjVQuQR4SwG3Ahi5FU/BxmNjZLZsBb+viMIC3K3kyN/4Zwzggas1XZ3llouDIAY7oezfvLBcbpIfx0dDo6IgKN3QxQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778629; c=relaxed/simple;
	bh=cMMF2HdBXovAwGKWBsbNZzfVVIZY9Hk4hQcBOoj+8l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qs0r04O1Xa0F1nMjKba35EYUiQyVG9YG2Zg3VkjI+rmU/6uLUB5HEnJx7zubfeodIaexLC+2iJypeZ0iFLZ/l/mi2R5AgankAt2StRegmFYItt0L+hmclNlkdz6bgNl99mcjv2jP30KqKoVL2Upch+aufVu8rvAAqDJ6w5r2RTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dSL4O8oI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dSL4O8oI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741778626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rHJGY8C19fifhcF/DJjR/owiAQUJdDL5zaoV733H4mc=;
	b=dSL4O8oINOJoaN2kz4JgP3RqpCVvpVw35cTmRXQwLHAx4fueA3KIN95E5/O6O+OL+qbvao
	GyOuk2fq43nlpsNZC+95dZNZselPYjPHD5dS1dFH9tPoSFjBAasTxJfnE6X8U6j8DhrD4H
	TBImnJNEcTqpttcoSWnUuSt7Cq4tk/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-BJi77JSXO9Krcbr2kurlbw-1; Wed, 12 Mar 2025 07:23:45 -0400
X-MC-Unique: BJi77JSXO9Krcbr2kurlbw-1
X-Mimecast-MFC-AGG-ID: BJi77JSXO9Krcbr2kurlbw_1741778624
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-391492acb59so2066033f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 04:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778623; x=1742383423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHJGY8C19fifhcF/DJjR/owiAQUJdDL5zaoV733H4mc=;
        b=EZ0eahUnGsLrt5Ui9yCvmVTtT8uB8DOUJyaNkhrTJ+RoHrNEsJ7r9D2dE/zI7HHDPh
         uReWCrYBSwLGnNacJwXUn4pog21XMV8vREernPcnVErUGsOnZ+MElEt0iS7af9cFeU/E
         LJ7/BaCb2n+AppYLquQpphaxwehuzBAK2aZ3zNOUB99kPIQtitY5Wg0uBPGD8+6XxGos
         rjo8BY1EhHss0ABmdezeWSMqqM0muX8UVOB57VsE7bKzT2vzKD3NNijZGcUMH8YE+YIz
         ITcn5sWd+fWePqLhT50/yITwODHw3eOne576RzfQv6tjtHsiX5E2JVRKC+GW3G/y+WdP
         u80w==
X-Gm-Message-State: AOJu0YxjjHWgJMMPxrPd0DO4Z8j8LCoBgs0K+yHVN5BYwrzeU/6qF4wA
	TsuuPmFkyou7E0McpR3v7bcS64u26wJSvIYiY6U50F2elKP6Nlttbj4ZAWBkbWpsr7kV/yzo7Ox
	BwOBaGlo7TlWMOJF2/nQDjpawO0YkfA5lAmKK2wcnErtSOOmmQfewwQ0wqTXv4Y4YEXGY97QW
X-Gm-Gg: ASbGncvOr8ITnVkoW2L1b8a4qvfb9UYj+E1J+4j8IzRJqEU11yqCjVzE79v0I7Ul64b
	ceQP61PoN9xQZhu40FEa3dygyvag8AEsM5482YNWKQGX6aAzw6wrEYpXyEQMTJKOCQEeh6oRVsJ
	eKEQG9q7Fb/7K63wM56KehVR1VArFKzuwi0MvAx5ahWPu8dDbSpjaf23LmTwPhjSjTyDfnN/oJ1
	7ihG/jBFYX9RJJTIPX7qR0hd6SsSRUALW0YAAFG8Jlmco/e9284KjajuDKBbSW417oC1iC0Ioiz
	5asB0uKtnw==
X-Received: by 2002:a05:6000:2cb:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-39132db8c73mr18115983f8f.44.1741778623454;
        Wed, 12 Mar 2025 04:23:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtRD8FL3AcQKDiGq9yU+1Ccjzd/DAwmG/Fp/puoXRlxcqGtndECywRKWJeL6HchNhOKU4TjQ==
X-Received: by 2002:a05:6000:2cb:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-39132db8c73mr18115965f8f.44.1741778623105;
        Wed, 12 Mar 2025 04:23:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a75a781sm18177065e9.24.2025.03.12.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:23:42 -0700 (PDT)
Date: Wed, 12 Mar 2025 07:23:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, parav@nvidia.com
Subject: Re: [PATCH v4] README.md: add example email for TC vote request
Message-ID: <20250312072309-mutt-send-email-mst@kernel.org>
References: <20250311212030.1745812-1-mvaralar@redhat.com>
 <20250311180828-mutt-send-email-mst@kernel.org>
 <Z9FPXdEPneX0azfg@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z9FPXdEPneX0azfg@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DMwPI7rpsDQWWv5gijxw9qh1kSfa2pp9AXYlnUchEEc_1741778624
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 12, 2025 at 10:09:49AM +0100, Matias Ezequiel Vara Larsen wrote:
> On Tue, Mar 11, 2025 at 06:09:36PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Mar 11, 2025 at 10:20:30PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > ---
> > > v3 -> v4: add "[]"
> > > v2 -> v3: use "()"
> > > v1 -> v2: add Subject and To
> > > ---
> > >  README.md | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/README.md b/README.md
> > > index c06caf6..f4b32ab 100644
> > > --- a/README.md
> > > +++ b/README.md
> > > @@ -206,7 +206,16 @@ The mail requesting the vote should include the following, on a line by itself:<
> > >  <code>
> > >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> > >  </code>
> > > -(NNN is the issue number)</li>
> > > +(NNN is the issue number)<br>
> > > +For example, you can use the following template when requesting the TC vote:<br>
> > > +<code>
> > > +Subject: [PATCH] (description of changes)<br>
> > 
> > Wait wait, this should be in response to the patch, no?
> > 
> > Subject: Re: [PATCH] (description of changes)<br>
> > In-Reply-To: (message id of the patch)
> > 
> > 
> 
> The patch introduces a template to ensure that when requesting to open a
> ballot, people include in the message both the GitHub issue link and the
> request itself. Do you think Subject and In-Reply-To are important in
> this context?
> 
> Matias

If you like, just drop the subject completely.

