Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9866A33D
	for <virtio-comment@lists.linux.dev>; Fri, 17 May 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715958263; cv=none; b=WaFKBlKA2WjGwr4EjD5VBW87TWfT9Iutw11ZjKQCdbCZxx72rRKKumZ16drti+JgMLLix/hkqlmxztxLWGT1QwEyZGWGbaRBmAClhmSJDlnyYNXwMRjCIsyyjDRr489+QPI1L1kAx6mUcxszfgqIb7HqFSTNOHbgIvgbwwxCF5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715958263; c=relaxed/simple;
	bh=eLCNZZfPRj5ygLZFrT5l+t8zZtx5qT5+fk3efXVk8WI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=S81NZ5p0xf3g4lpRl6QR9SAYMEtjUXqZ/M77N/xZ5mZg5PFZKjAZ9p9tUYptr1qIysHTWTLBoo/V3TOKMB46iZwgbRrmGjZf6gBBfZvCFBVLZtJapqGTnZPrINO7Wre3yZ5Xc3rWvkW0ZeYezK4AbbNHHHX+lrfNV13j92qK1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bedrocksystems.com; spf=pass smtp.mailfrom=bedrocksystems.com; dkim=pass (2048-bit key) header.d=bedrocksystems.com header.i=@bedrocksystems.com header.b=bApNTfX3; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bedrocksystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bedrocksystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedrocksystems.com header.i=@bedrocksystems.com header.b="bApNTfX3"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6f0fbd2d9ebso933845a34.2
        for <virtio-comment@lists.linux.dev>; Fri, 17 May 2024 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bedrocksystems.com; s=google; t=1715958261; x=1716563061; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rmkm21RuJJQ0oJzBvOv2QS2o5xp+YSv2jehB/6F6pCU=;
        b=bApNTfX3CiKjbu0CRdY546XdkacyMGItjPwzGxKcmOb6/sIleV5cSZXukCr1gpQlTz
         CrXQ9tek9+0EndHn0eB7Lx2EqqelbDHmxluHaTxOAiPwnzEmYIKUYeNqmB9pdS5fUXF0
         KcYVRlVXgMuf+Yab2vcYuZ0DCxLIVVX9cO+0qvUfZLKgPvglU4Bs3XZTlk0Y964t5UHi
         icXxNznOb7VKA6cmikzcEk86o+J/lXWM6TiyrZg7KjbF0s5Rjq5kKdR70p5jEKemD483
         zg2mzTauT7NGe4G4tu4j9usoPpji3jrVZSo9Kkh8zxQmLF2hDDQm+sbPUifV6oyiUnk1
         6UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715958261; x=1716563061;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rmkm21RuJJQ0oJzBvOv2QS2o5xp+YSv2jehB/6F6pCU=;
        b=s6mW1m64U+s/P1yREa01nYPNid/Q/+c0/tuvtMN5B1emgX3PkwbSGG920tTdUYzcy7
         wl2Dr5LY2bg5gDbdL4kTMHU/b8yzBHrUcueVQnBqm8hwwwT1iPO0FgDKbFqI84IjlzVw
         +SBrsM4H2Pq41nD2qwUjDQn7XgKS/XicAuJ2k8AH49/aOtT0hgoU1EDR/2ZppBLCV2kQ
         RBzT4vjAHtEThll8LRLARBnbeQXTIw4ayYtd05iY9rMIZLqo9vpISGqPcZCP6yDYL+qD
         +q/5kwWMhHpUjciX2qAaSU0wWLCSD0I2oKaKPEGuk+EC2prJ8oy7UjF/6eeeWfBmIS7K
         LQZg==
X-Gm-Message-State: AOJu0Yy62GrpjJI94jIMNXw9W2bTuU00c4QXYT8fJugvpdtb3WtZ64Nj
	uphKEm5/fhknI6Sy9o0br9Y5SZvrcwH+4c4WRSkSPLFHEtZ6YHBIDYqxersf7Lxg8jrfOIy+Tad
	FocjzJDO2L7LWwGsQotA1e/xfnJjiyLTPg9YdiyAueNf3psyU
X-Google-Smtp-Source: AGHT+IH+tfPv61sQPwkF5g6lSO2N4rTGNA0kxLmW8WxgXm6BqZJpa7y/GEFjtkpUBzy92DviFz0m64+OkjeDwyikv2Q=
X-Received: by 2002:a05:6830:204e:b0:6f0:497e:84ad with SMTP id
 46e09a7af769-6f0e92d3a54mr28436725a34.38.1715958259414; Fri, 17 May 2024
 08:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jasper Haag <jasper@bedrocksystems.com>
Date: Fri, 17 May 2024 11:04:08 -0400
Message-ID: <CA+c=0WfBi_AKk+5s=Tmn2vKHS-Zz8wYk4DZMtLJa-fEDCDPW-g@mail.gmail.com>
Subject: [virtio-queue] CLARIFICATION: Metadata address translation w/VIRTIO_F_ACCESS_PLATFORM
To: virtio-comment@lists.linux.dev
Cc: Awais Masood <awais@bedrocksystems.com>, Gordon Stewart <gordon@bedrocksystems.com>
Content-Type: multipart/alternative; boundary="0000000000008092830618a7aaae"

--0000000000008092830618a7aaae
Content-Type: text/plain; charset="UTF-8"

To whom it may concern,

If a VIRTIO Device and Driver enable [VIRTIO_F_ACCESS_PLATFORM] during
feature
negotiation (and certain other platform-specific conditions hold, cf.
VIRTIO 1.3 --
6 - Reserved Feature Bits
<https://docs.oasis-open.org/virtio/virtio/v1.3/csd01/virtio-v1.3-csd01.pdf
>),
addresses supplied by the Driver will be treated as bus addresses and
translated (e.g.
using VIRTIO IOMMU mappings) before access. Indeed, both metadata addresses
(sent statically from the Driver to the Device during queue initialization)
and payload
addresses (sent dynamically from the Driver to the Device via exposed
descriptors)
undergo translation when the aforementioned conditions are met.

For payload addresses this is all well and good; payload addresses are
communicated
dynamically via the address field within Descriptors, and client code is
structured in a
way which makes it easy to synchronize translations & dereferences with
mapping
updates at the point where a payload copy occurs. However, the situation is
less
ergonomic for metadata addresses which are communicated statically during
queue
initialization. To wit, if the mappings backing metadata addresses can be
modified
concurrently by the Driver then all Device queue operations must be
synchronized with
the (un)mapping logic, lest some accesses be lost (or result in translation
failures).
Indeed, this greatly complicates a "naive" implementation which statically
produces
Device addresses corresponding to the metadata regions received at
connection time.

If address translation is enabled via [VIRTIO_F_ACCESS_PLATFORM] (+
additional
platform-specific conditions), can the mappings backing the metadata
regions be
changed? In other words, can the metadata bus-address ranges be remapped to
different underlying address ranges after VIRTIO Device initialization? Or,
alternatively,
are the metadata addresses communicated during initialization considered
"static" -
regardless of how those addresses are ultimately interpreted?

Regards,
Jasper Haag

--0000000000008092830618a7aaae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div id=3D"m_-3543151031032808791m_-3274118=
489616338756gmail-:1vq"><div id=3D"m_-3543151031032808791m_-327411848961633=
8756gmail-:1vl"><div dir=3D"ltr">To whom it may concern,<br><br>If a VIRTIO=
 Device and Driver enable [VIRTIO_F_ACCESS_PLATFORM] during feature<br>nego=
tiation (and certain other platform-specific conditions hold, cf. VIRTIO 1.=
3 --<br>6 - Reserved Feature Bits<br>&lt;<a href=3D"https://docs.oasis-open=
.org/virtio/virtio/v1.3/csd01/virtio-v1.3-csd01.pdf" target=3D"_blank">http=
s://docs.oasis-open.org/virtio/virtio/v1.3/csd01/virtio-v1.3-csd01.pdf</a>&=
gt;),<br>addresses supplied by the Driver will be treated as bus addresses =
and translated (e.g.<br>using VIRTIO IOMMU mappings) before access. Indeed,=
 both metadata addresses<br>(sent statically from the Driver to the Device =
during queue initialization) and payload<br>addresses (sent dynamically fro=
m the Driver to the Device via exposed descriptors)<br>undergo translation =
when the aforementioned conditions are met.<br><br>For payload addresses th=
is is all well and good; payload addresses are communicated</div><div>dynam=
ically via the address field within Descriptors, and client code is  struct=
ured in a</div><div>way which makes it easy to synchronize translations &am=
p; dereferences with mapping</div><div>updates at the point where a payload=
 copy occurs. However, the situation is less</div><div>ergonomic for metada=
ta addresses which are communicated statically during queue</div><div>initi=
alization. To wit, if the mappings backing metadata addresses can be modifi=
ed</div><div>concurrently by the Driver then all Device queue operations mu=
st be synchronized with</div><div>the (un)mapping logic, lest some accesses=
 be lost (or result in translation failures).</div><div>Indeed, this greatl=
y complicates a &quot;naive&quot; implementation which statically produces<=
/div><div>Device addresses corresponding to the metadata regions received a=
t connection time.<br></div><div><br>If address translation is enabled via =
[VIRTIO_F_ACCESS_PLATFORM] (+ additional<br>platform-specific conditions), =
can the mappings backing the metadata regions be<br>changed? In other words=
, can the metadata bus-address ranges be remapped to<br>different underlyin=
g address ranges after VIRTIO Device initialization? Or, alternatively,<br>=
are the metadata addresses communicated during initialization considered &q=
uot;static&quot; -<br>regardless of how those addresses are ultimately inte=
rpreted?<br><br>Regards,<br>Jasper Haag<div><br></div></div><div>
</div></div></div></div></div><div></div></div><div><div><div><div id=3D"m_=
-3543151031032808791m_-3274118489616338756gmail-:1vp"><table role=3D"presen=
tation"><tbody><tr><td><img id=3D"m_-3543151031032808791m_-3274118489616338=
756gmail-:fl_78" name=3D"m_-3543151031032808791_m_-3274118489616338756_gmai=
l-:fl" src=3D"https://lh3.googleusercontent.com/a/ACg8ocLXkoDEmyEOt6yr9YGA_=
McbnL-A1UQJCcrKU74VVkIzyiyxfVw=3Ds40-p"></td><td><div><div></div></div><br>=
</td></tr></tbody></table></div></div></div></div></div>

--0000000000008092830618a7aaae--
