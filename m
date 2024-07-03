Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C4191F6E
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720047348; cv=none; b=q5RHgO1HaWuJt14JoPupiqBBW71Mknd/+gakgSIl9DfYqHzOelb/AKaYpf/XFs/qkyXUdyxJOWv6rJ7XnJAtEc9Rs0ZJsa+QF/hcCmSXGpreUSEsurKNg8wE6DYCT6JWe3iOnF5zDmhybs++WJiFVf7OZ87I7DO0ovkh0goGe34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720047348; c=relaxed/simple;
	bh=a4ZP7s6cwQyDB8wk7YG0oWb0K7O7o7nO8DxmVY5QII8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fAT1/U0N9w87QfQugaqHPul2iu3LaTx8sHxqNxYEXZO6UMEC7+jnW6pLgpLcAzDhrxHtWD/ShF2W8s3v8qtbOXMy0MdieF4Gg1nMJT+7XBpv00PXsN4vj+cY4IrBAmz8zmqg4J38jPzFxUNJxzAnL57aL7Nx7OzvhX81UzEWZ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVDzbl0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVDzbl0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720047346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TTVM/FMP9nyZ7A1V3jK5DAMyVvZlhGcbkiAwmnDs1UI=;
	b=MVDzbl0GqYu/ZJ6u+XlZInjQNVodq/adXijyog/0O9DpPQoyBUoMSs5w85HzQH2BP2WClF
	BUxY1knp6ab1NQr1Y331SYK3bOJXswLS/TL4jkurc+ZSuFpKWesW5YrTprYlnUE2IEoqcq
	lM9WdaMD383uq2KA03VPyBn1fa+reTU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-C0_7rUEVNDOUq-TOy83dgA-1; Wed, 03 Jul 2024 18:55:45 -0400
X-MC-Unique: C0_7rUEVNDOUq-TOy83dgA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7535875ab7so146190366b.0
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 15:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720047343; x=1720652143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTVM/FMP9nyZ7A1V3jK5DAMyVvZlhGcbkiAwmnDs1UI=;
        b=IDDdjUi1bYh614y1q7JD1qIK/00fFpnW4DkaQBLYrB6lQ4SHv39G1sBrKueTd5a6Si
         TcHX1bdTgoMgR4EwE/ePPJu5BjA6T6Ikeb23jgP+v2NMG2BTZwc2G77ERpQMr+O3MHwG
         O8p+iriWxNWqABD7rMnxTaz88dUCB1v83MkHrtCdYY52xy48EFKQFLsvWKv4j4424VHJ
         5zP9tb5gw2oKYlUsU9md7pQWAIjNTP32D/h77eqrgsTganTvZ6YkUz3gi7WkgmjFTLEp
         DQi0cv5e/9Z6EniVLA5MPn4C5J5SwcCmvDBTt1/jl5b9nrCT2Os98SEhJNOaSIK5V1QB
         Qsmg==
X-Forwarded-Encrypted: i=1; AJvYcCUSNwfHNrhtR10FqEyZEtJbnugWI6Chp0jfFq/MMYhK24Mc7rAqpql+kdVNLvx7xAZbvZiIcGyJbI0RghO8U2Opei2jB/FUe3yKmyNtbfw=
X-Gm-Message-State: AOJu0Yyagcs5jfmDUl1cJdZal8c1JOr+itZIdR0G4/3la9HT645udJ/t
	ZvLb8GY3ysAIvvb/xGCODFq4NoZO+ll+dGtNqb4GMsQI/HfvX1IVxoyo/7SRH26Mq4c/XOLmmq6
	96w1o1VVtZo3ta5tClgiVQZpe3e8/XyzndI8FW7rDUPNS9IcH6bxmWaG2OjoX42LLlvO/5iFR
X-Received: by 2002:a17:906:17c3:b0:a6f:e069:3b06 with SMTP id a640c23a62f3a-a77a243c108mr198445866b.21.1720047343413;
        Wed, 03 Jul 2024 15:55:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHone+LfGWgR6fNysQZ30Ok9Mmi6h2pp5UFQfClYHHe+9VWq/LNwrBYlURuSNZuSL9JYtzrBg==
X-Received: by 2002:a17:906:17c3:b0:a6f:e069:3b06 with SMTP id a640c23a62f3a-a77a243c108mr198445266b.21.1720047342925;
        Wed, 03 Jul 2024 15:55:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0b84f7sm546563866b.224.2024.07.03.15.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 15:55:42 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:55:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Keiichi Watanabe <keiichiw@chromium.org>,
	virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Message-ID: <20240703185505-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240619140024.GA57633@fedora.redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240619140024.GA57633@fedora.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 10:00:24AM -0400, Stefan Hajnoczi wrote:
> On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> > This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> > the device's ENOSPC error to the driver so the driver can treat it
> > in a different way from other IO errors.
> > More motivation is explained in fs-devel mail [1].
> > 
> > [2] is a prototype implementation in crosvm and [3] is in virtio-blk
> > driver. Idealy, the error should be propagated to the guest file system
> > and handled smartly, but the part is still under discussion.
> > 
> > [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEya8878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
> 
> I have replied on linux-fsdevel so we can discuss a bit more about the
> context and get input from storage and file systems people.
> 
> Thanks,
> Stefan

Stefan could you also comment on whether we are likely to add many more
errno values soonish?


> > [2]: https://crrev.com/c/5599649
> > [3]: https://crrev.com/c/5600325
> > 
> > 
> > *** BLURB HERE ***
> > 
> > Keiichi Watanabe (1):
> >   virito-blk: Support NOSPC error
> > 
> >  device-types/blk/description.tex | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > -- 
> > 2.45.2.627.g7a2c4fd464-goog
> > 
> > 


