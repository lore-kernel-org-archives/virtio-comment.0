Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D33E6394
	for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873236; cv=none; b=WDcU9f5QeOdO83PgqWsxlVNHDGAD17xWP+lBDnwyZp16hWNaXifGNq8G69STmzJY5s7vPzCwMkYL+bJ4vP98RZVWJuaaKa1wE96gej2M+1Res5m1RtHX78vDsa9ZR09cYDhugowk8TzSy94ITDO7l4gTM+qXVSbDNF/EHPRlkr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873236; c=relaxed/simple;
	bh=CJH8LWK+ZxE8SroMGKhBXRGDE0HvKAGQuhjXutifzXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M08SOmRovJ4NwBisDSEVZXA6cvPw+RDb9BYESkX17vtnCZhikkMFDDy/r95NL27girrH3FwNoHHtL+0yZrhKyPzcGMiJfGeTP6oe5GPc4YNym58Zo8tcv7HA3H2x1ppzmFa6MEWs+4VKUBzPzosUjlz7NYAAo7SJUJVIE9aBOxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/9NpZui; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/9NpZui"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so8128476f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779873230; x=1780478030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k89uV43GsFYF7LuEhcEFZMHEV5G0rCccRoV7T0MulpU=;
        b=A/9NpZuiNQvAZ9fe1wgOJyq4ZsRDajUvD+dcZYvpNP59mnPOQfpr+GEuUs+YbziOjT
         lIRZWiIZ6mca43X5IvMSBrhr5gR2wF8SB1D/TOfeOoFG40jHTHU1CUCu5kmPWGjpfyAO
         8ZsB8YLIxoj/QV2pakh1X7UnYhJPmeTuEBwg50V9n8maCgedPthb60611fV1vlrp9xUO
         LRh1MhecgM7BbX+7+nAyzah8KBqaeHluqwI/L5oIbn5mQiKLZzBcYZnRydkw6sDZFJKI
         yhI7lkK6sbUW8DwUEah6LNXDx6b7klp2BBlBCwaqiAKjkyQdf2hc6n6AvR4ItVI0OVl5
         mQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873230; x=1780478030;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k89uV43GsFYF7LuEhcEFZMHEV5G0rCccRoV7T0MulpU=;
        b=FLgtJxs1+7pHdLNBuScDMJNyOzZqiWcPIIY26203O756EgsrujMBcN/V5EdmlSkiYj
         0bjv5+T6Oc94UV9nOsJCbVQhuFV5EeSb76s7vfVsCn/RkBUEmS8/swXj9JFVco+rucB0
         fWiR7tWFZ0wqRUZ2dvIGb24gg0Q41TPU4Qjp7K0d1oVDVeAUIMIHN9LH09p6fm9d9URd
         fGL/JVcewqY1EP3lqfyTKF7Erfb0Zut8JNzPsYODHUayRPgf5lIPztXyqyiJvCQPt9ya
         W8b7hmJLAdcXNed2JDdF93EJZqjcmmBbJfPmqxkylp9+3GYMccj0xfPQeHCfO2xaE1+k
         UpAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cU/6sB23cqAQJ8eS4Tq3RY18zH6lwN5lndc+ozFQ1/zZ+IBFNeglJhSeu8hTKHORj0IaR5Rv8hjIspggU2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzly8YQ86gockpkYRIh8Ih8YKQqAuf2+gxNg2hfD6hUP7uWRULl
	X3XIhSwfZN5NUsu9boAFdPk+Ba0WbsepUhv/RIj78PtkQuApzU3ZCruH9UDxRGxmOHU=
X-Gm-Gg: Acq92OFUYk3vOJL0lInxufyny8IPGlP/CUaMHYK5IETzJMdsTubVCHvuiXKckOREosu
	qt3kyHba4MkIbl/O+II+EJb5cxvt1DzK4imKerD2i1aCba2pgMh5wyPX4zzB3xoYAzBNnwUTQNb
	buveuCVXradH6r6J5lbX4pLGDVfLj51fhvYN3wktYEMuPHPeStA1q2IKxd0nniD7mv9E5BrxgZ8
	2NXf4j12vzNqgG2GluETP/pJ0Q+o+hcBOKr/LICTBqBj8SAV95mdstyt5yRRZQ86NBVOPbDxslH
	cg/9OsPSEyDde4KANEURdjHgsuhwE0bHw3xQTHkt6/jgpB879uHKbpM3JoO71rq/ozp8yI/6J/i
	pm0sgMswaw3llljbx3BA2AvWFr/sCaAQoerg1mPQTXMYAUSQ+gBwiaxX1vHW4RFbmjMVMBPhoIj
	1sMPs/FvD/8p/oSXLMv8iWjPY=
X-Received: by 2002:a05:6000:2888:b0:45d:4c30:81a6 with SMTP id ffacd0b85a97d-45eb30de822mr34820497f8f.5.1779873229458;
        Wed, 27 May 2026 02:13:49 -0700 (PDT)
Received: from draig.lan ([185.124.0.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm5226363f8f.12.2026.05.27.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:13:48 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CA1A15F7F0;
	Wed, 27 May 2026 10:13:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel <qemu-devel@nongnu.org>,  virtio-comment@lists.linux.dev,
 dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Demi Marie Obenour
 <demi@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>, Albert Esteve
 <aesteve@redhat.com>, Mark Burton <MBURTON@QTI.QUALCOMM.COM>, Matti Moell
 <matti@qti.qualcomm.com>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Dorinda Bassey
 <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>, Vishwanath Seshagiri
 <vishs@meta.com>, Rob Bradford <rbradford@meta.com>, Zhengyu Zhao
 <zhaozhengyu@bytedance.com>, Jorge E. Moreira <jemoreira@google.com>
Subject: Where should the vhost-user specification live?
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Wed, 27 May 2026 10:13:47 +0100
Message-ID: <874ijtz038.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Apologies for the wide cross-posting but I wanted to find as many
interested parties as possible.

The vhost-user specification currently lives in the main qemu
repository (docs/interop/vhost-user.rst) mainly due to historical
reasons. QEMU was one of the first VMMs to implement vhost-user and the
spec needed to live somewhere.

However there are now vhost-user implementations for QEMU, rust-vmm,
cloud hypervisor and I think CrosVM. We get queries about changing or
updating the spec on qemu-devel from time to time and I feel that given
it is an interoperability specification we should think about hosting
it and its discussions elsewhere.

I think broadly there are 4 options:

  *  Move into the OASIS VirtIO group as an appendix/addendum to the main
     VirtIO spec.

     This probably brings the widest visibility to changes to those that
     might be affected. However it does come with a certain amount of
     bureaucracy with the OASIS process where only members can vote on
     changes. While intimately tied to VirtIO it's concerns are more
     focused on practical implementation details of the IPC between VMMs
     and device backends.

  * Move to a separate project under the qemu-project space.

    QEMU hosts a number of sub-projects and mirrors so it would be easy
    enough to split the spec into its own repo. Changes to the
    specification could then be divorced from QEMU's release cycle and
    at the maintainers option issues and merging strategies could be
    configured for just the specification.

  * Create a new project just for vhost-user

    The interested parties could decide where to host (github, gitlab,
    forgejo, whatever..) and decide to move away from mailing lists
    altogether or create a mailing list but manage changes via the forge
    interface.

  * Status quo

    Just keep the spec where it is and muddle through as before. Maybe
    we could improve the contribution documentation for how and when
    changes are discussed.

Any thoughts?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
