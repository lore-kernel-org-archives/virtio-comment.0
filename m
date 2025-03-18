Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900E1993B2
	for <virtio-comment@lists.linux.dev>; Tue, 18 Mar 2025 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288584; cv=none; b=M6NeVHk8Vf1ZOTcJ9elbepnjXLDgLJ3VD4shqkyoxumsMPC+gaFggzmmvso8oE7X6/suXGhTEXTb9l+497tSC37jFvEHFqmr6HkH7DrbtoofLjxJX7l4PWiENKXkGxSaPMuSbnI6f/RSbiXRxD3SBDKWeyvUHrHQKGEqajuZZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288584; c=relaxed/simple;
	bh=YrkuexhkYYOuxOSuRFKdpar2g6kUMQYIDZOd1EJLNVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHBmDeblx9QObBAZauhHXa7vQw70GwKyDfbyDaSOiIXZE8gYnkvROsVuRVdPqFfHPIwQuLbt482qux1fkYk5BXXD0fPj1Dtf3B3tbxBUSNA1VNZMWSFh8VIpFFL4mki58ZLFLqwQkTG3SslsrS+CTsge8mBglvn/iFPGqRAdsws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BZp2VXQl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BZp2VXQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742288582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrkuexhkYYOuxOSuRFKdpar2g6kUMQYIDZOd1EJLNVY=;
	b=BZp2VXQlrhVulyX8y5HD1dNh6H047SbbgST0anipVvReQXy50yFnrX323LexxBIi6k7Mnu
	b/QOGQiLAazCU/8j9Pio3qdriIrbv05c63WcF8I3l/UZxeyXfU55mPCdE7voBbGEWtg3A5
	hevFEnn6xXy4nBwl9WkSMC5h6CpZ+h4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-o9e9BO1xOUyTAGW8WC3YtA-1; Tue, 18 Mar 2025 05:02:55 -0400
X-MC-Unique: o9e9BO1xOUyTAGW8WC3YtA-1
X-Mimecast-MFC-AGG-ID: o9e9BO1xOUyTAGW8WC3YtA_1742288574
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so4884038a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Mar 2025 02:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288574; x=1742893374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrkuexhkYYOuxOSuRFKdpar2g6kUMQYIDZOd1EJLNVY=;
        b=D9MO/mYD9Uhhb3QJoEjDqQzDYF7eS0AwAF9Sh4vE81RakPOGYdIr0PYMOH1ODa/fSa
         nvE6O5XCkJSHUta5uYIFWq8IjKvZBqh/ZGiu1YXSCnB4iNyiYsEA9FWE7o09WhRTe/Da
         hX09lBDpMrSKtRMLpyj1g1yWIDweiEm+z0xu63KPaxXoNaATTW5kAiiBNkqLwCtXqmg8
         XAjPIZlTgA+DkGIK/AdpNXtigOImDtlNL7AlyP/GPNc3UZnNZF/s8Vcq++FZV18/H8y0
         H2ozEcO64flEe+LtyjOISN1KyvL9STC2aG/pVq1ICVANZFF9tnJBnFlrAuf7VaiMmci7
         CXPg==
X-Gm-Message-State: AOJu0YyBEfpq30b6BIw9Czy0LQLYGgnVaXsDblxYoeROcNm2jMB+dC/N
	BdGd0HNMv76jdUiczLZ5JEnbQX2j3PsWk7RfsNajdJbdyHjYd2JAV4bmiv+EZXsKMW0XmnkPYGM
	qHNiqG5EnakL5/mlKa67YT8fIza9vatkjGowOIATZFXmk41e31g0Y1EWJEt/VyC0UTIcGcC3MI6
	GjJQJ0+jNxOyPTHKDZqvyO3uOO5ZINkxgUyYcxImU=
X-Gm-Gg: ASbGncuK/a8pozfBqSre39BlxheFiuYC6IeEEuaN73/1PfpxE2L7B+eMYK7LKoo90gD
	jCe7ddU0qiFSaZRNu73vsOpRUUz+xrGx/Q5DmLCgArkFHZ9MBDruhsDax3WLJmf/5uWfvM/fGS8
	0=
X-Received: by 2002:a17:90b:388b:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-301a5b80bd4mr1916017a91.28.1742288574025;
        Tue, 18 Mar 2025 02:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUSLRY6B5TI4qV2fSzsh19fPiaH8R5a6rnEvByNbHUhpZpfJiB6SknqzL9mKqTXicVGWkE47CXzRfsTDGLjVY=
X-Received: by 2002:a17:90b:388b:b0:2ee:d824:b559 with SMTP id
 98e67ed59e1d1-301a5b80bd4mr1915999a91.28.1742288573777; Tue, 18 Mar 2025
 02:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304130134.1856056-1-aesteve@redhat.com> <20250304130134.1856056-2-aesteve@redhat.com>
 <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com>
In-Reply-To: <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 18 Mar 2025 10:02:41 +0100
X-Gm-Features: AQ5f1JrgILOaQnYKauxV2vxV017fvbYsuNxrhyNFy7Bz86ga1tbuSPDRmvsHvpI
Message-ID: <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <gnurou@gmail.com>
Cc: virtio-comment@lists.linux.dev, nicolas.dufresne@collabora.com, 
	cohuck@redhat.com, adelva@google.com, mvaralar@redhat.com, hverkuil@xs4all.nl, 
	mst@redhat.com, dverkamp@chromium.org, gurchetansingh@google.com, 
	alex.bennee@linaro.org, changyeon@google.com, daniel.almeida@collabora.com, 
	agordeev@qti.qualcomm.com, eballetb@redhat.com, ribalda@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hLNDPt6phZWlcHzyICxWuO-S6YY2Pp9lWacldcprm3A_1742288574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 2:26=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com=
> wrote:
>
> Hello Albert,
>
> On Tue Mar 4, 2025 at 10:01 PM JST, Albert Esteve wrote:
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2.
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver on the host or guest side -
> > V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
>
> Thank you for your patience with this. I have done a final pass on this
> version and it looks great to me!
>
> Reviewed-by: Alexandre Courbot <gnurou@gmail.com>
>

Thanks! Could we please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/214

