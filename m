Return-Path: <alvaro.karsz@solid-run.com>
MIME-Version: 1.0
References: <20220615143916.3563008-1-alvaro.karsz@solid-run.com> <87v8su8hzc.fsf@redhat.com>
In-Reply-To: <87v8su8hzc.fsf@redhat.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 21 Jun 2022 13:23:40 +0300
Message-ID: <CAJs=3_D0Ou99btHFm7_1LHk+7FCdWnbKZCrzS5Ypj1sityVCBQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v7] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

> Note that we are currently voting on
> https://lists.oasis-open.org/archives/virtio-comment/202110/msg00010.html,
> which uses feature bits 54 + 55, so this would need to pick another
> one. No big deal, though, as we still have spare bits until we reach
> 50. [Should we need to go to the range above 63, IIRC at least PCI would
> need a tweak to support more than 64 feature bits, but that's not urgent
> yet.]

Do you want me to create a new version with a different bit?
Or should I wait a little longer for comments/ack from a member who is
 more familiar with virtio-net?

