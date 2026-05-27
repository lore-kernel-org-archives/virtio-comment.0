Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB421E091
	for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886529; cv=none; b=VFi5LWpZEf2WcGMH+p5RhEgveCa8rhRfAs/XLOe9hfP1qN+Dk53ohEQHr+jxCchYbHQe6zmiDe58Bx0fiosAmnl2masH1i4rYm9TQcyiE54uS/zBCD4Xx2c8qEq0DD2/bjdAGrxHNRMK5xp5dj4CFSMI9+8Pm3tj9SJt3Pq1qrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886529; c=relaxed/simple;
	bh=es85TulgxG11GrPlY8p8ywOGF4SYIzPBgko91AtDzio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ju3dOZ5+77qcDVAuRXiJDzGKSmT+hKLdWQDo6uLKO0DT1a2+ONKILRMVrMPDrrPAMwSQAzJ3pR+yMsqx1ovCIvapX4FEm+Xq7MKvF1Vsj4iw8kjrBjxU2caBW5H8x4GAkgTObbMYDzgxZ9tLfLPReWPFElaqPVJNkQlawRI4ZYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=idmujglP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="idmujglP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779886526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJICiy2Q3nyEeJUJ+V4JQoHzP7OLNBjqunMM0jBV0N4=;
	b=idmujglPIYyZAu0e6wAtGungZjDSpIU2UPurdPyEszRbQqzm/I99iAzV9NN/MjjotWJnbp
	9WPm+xUK7nXZmBtAd8yNw1etsebQ+NSk9XLP71XZd/zcWPXjoYm70vJ9HWH461cCxlw5k3
	ELMhsvfQW9nGvFRMdZcH1K9NBqwOzAQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-Wuwkyn74NbqjoAShMb5NUw-1; Wed, 27 May 2026 08:55:23 -0400
X-MC-Unique: Wuwkyn74NbqjoAShMb5NUw-1
X-Mimecast-MFC-AGG-ID: Wuwkyn74NbqjoAShMb5NUw_1779886522
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45e80183514so8104758f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 05:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779886522; x=1780491322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJICiy2Q3nyEeJUJ+V4JQoHzP7OLNBjqunMM0jBV0N4=;
        b=qoD0MiUpYA1mQl1Ccu334wCTMHhC5eDFAy/EgfMBQmvRJbIprBn7WOyStOlvnw4Pk1
         rv5RPplgW8hsq5k3M1nljvDzntPEnFSwPlfBIjr6X4oL/m2i5eb5AmUxxo9TSWLgt4mE
         2DzlZRq5Y0iMZN587437QSEchOFPotsDWz84PwF32NVWjq1xnMtY8u/3Ig+s+4NIaChe
         q0xBxIFyaNlXM/kSIR1shQUwsJgTFPWYM50lbWAIdn4YsCppvi/55HkNQ1zZdMi9bwDl
         M2PN7n9rkApZSF37MLDcniDtLgq6M2c1VqCPngI/vKk/85ihsGAqBi9B+T2ctBkzxbUQ
         YpOA==
X-Forwarded-Encrypted: i=1; AFNElJ8asY/L4LNw7PmI+3mZjBqbLWYYJnOQE768va17J3OizvHtjuEOGZnX4J0GB5evae3R3WThV89NfRWXdmxh/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YynF9aN3Ljo2o6XcgHyXsKCoRxQO3XvMZJK5Vu9kjhc/U3O0CzS
	yy7Z9Mvgz245gcdYDbvi/3lAoRWquU5sPOA/vbXk5l4kulm5B7mJ+xpOep+uMlLeEW2e2+k9rHr
	4Da8s6xBJKwFICQkDISJEJcEbZhV/Qd89WyyZapv/n4shVpByVpckw0ncd2zuvmXFalzI
X-Gm-Gg: Acq92OFlhjzfGoKPAkWqprfOYZKtak23pz1IPA00+W2V0aoWw7dMhI3++dtro01cY+z
	k6UXoFSaNL1GEs4IzvoPRtPlNa+77XXcIEQH785vxcUbe2cgq2DKY+KADqms6dE4JkBprpblSly
	h5GtmyrP9BiUF5J6q/N8/zoGY6/4pfObM+PjcBZv9J9M0hqOhxhuFmtsYV7ea4DoFBRw0R5GHxa
	3hZh4qFpxxdP2SnJ8TbmnQIxdr1iWTE6919FwmcowQsSt1DklaKXgH/aWin/Hso8Iba2PuQ5VSr
	SfBLzreTZn0pPdU9UEUqj43UNXVEXky+/ERjzatFi7eV2v3bCHnnlnp5RoEcE6ZqBwuYHD0euHX
	pQ7DpeKtZh6E8Ir8San6LuEs/O/Wst1ook0dJlDYyyv0=
X-Received: by 2002:a05:6000:41f0:b0:45e:9ea3:ce9a with SMTP id ffacd0b85a97d-45eb3688c81mr35406438f8f.8.1779886521920;
        Wed, 27 May 2026 05:55:21 -0700 (PDT)
X-Received: by 2002:a05:6000:41f0:b0:45e:9ea3:ce9a with SMTP id ffacd0b85a97d-45eb3688c81mr35406378f8f.8.1779886521316;
        Wed, 27 May 2026 05:55:21 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a28casm8613367f8f.23.2026.05.27.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:55:18 -0700 (PDT)
Date: Wed, 27 May 2026 08:55:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Albert Esteve <aesteve@redhat.com>,
	Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260527085058-mutt-send-email-mst@kernel.org>
References: <874ijtz038.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <874ijtz038.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yNTV2aM7SewZhWC5fxEmWUQ3SrkOgymlxq43xwn_PoY_1779886522
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 27, 2026 at 10:13:47AM +0100, Alex Bennée wrote:
> 
> Hi,
> 
> Apologies for the wide cross-posting but I wanted to find as many
> interested parties as possible.
> 
> The vhost-user specification currently lives in the main qemu
> repository (docs/interop/vhost-user.rst) mainly due to historical
> reasons. QEMU was one of the first VMMs to implement vhost-user and the
> spec needed to live somewhere.
> 
> However there are now vhost-user implementations for QEMU, rust-vmm,
> cloud hypervisor and I think CrosVM. We get queries about changing or
> updating the spec on qemu-devel from time to time and I feel that given
> it is an interoperability specification we should think about hosting
> it and its discussions elsewhere.
> 
> I think broadly there are 4 options:
> 
>   *  Move into the OASIS VirtIO group as an appendix/addendum to the main
>      VirtIO spec.
> 
>      This probably brings the widest visibility to changes to those that
>      might be affected. However it does come with a certain amount of
>      bureaucracy with the OASIS process where only members can vote on
>      changes. While intimately tied to VirtIO it's concerns are more
>      focused on practical implementation details of the IPC between VMMs
>      and device backends.
> 
>   * Move to a separate project under the qemu-project space.
> 
>     QEMU hosts a number of sub-projects and mirrors so it would be easy
>     enough to split the spec into its own repo. Changes to the
>     specification could then be divorced from QEMU's release cycle and
>     at the maintainers option issues and merging strategies could be
>     configured for just the specification.
> 
>   * Create a new project just for vhost-user
> 
>     The interested parties could decide where to host (github, gitlab,
>     forgejo, whatever..) and decide to move away from mailing lists
>     altogether or create a mailing list but manage changes via the forge
>     interface.
> 
>   * Status quo
> 
>     Just keep the spec where it is and muddle through as before. Maybe
>     we could improve the contribution documentation for how and when
>     changes are discussed.
> 
> Any thoughts?
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

I think what is missing here is what are the pros for any of the
proposed changed?  What are the issues we are trying to solve?
What 'queries about changing or updating the spec' were problematic?

Thanks,

-- 
MST

