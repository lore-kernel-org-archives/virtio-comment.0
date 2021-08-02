Return-Path: <alex.bennee@linaro.org>
References: <20210722110903.8769-1-alex.bennee@linaro.org>
 <87czr34v66.fsf@redhat.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [virtio-comment] [PATCH] virtio-rpmb: fix the description for
 multi-block reads
Date: Mon, 02 Aug 2021 08:09:42 +0100
In-reply-to: <87czr34v66.fsf@redhat.com>
Message-ID: <87y29kgw3i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, maxim.uvarov@linaro.org, joakim.bech@linaro.org, ulf.hansson@linaro.org, ilias.apalodimas@linaro.org, arnd@linaro.org, ruchika.gupta@linaro.org, tomas.winkler@intel.com, yang.huang@intel.com, bing.zhu@intel.com, Matti.Moell@opensynergy.com, hmo@opensynergy.com
List-ID: <virtio-comment.lists.oasis-open.org>


Cornelia Huck <cohuck@redhat.com> writes:

> On Thu, Jul 22 2021, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Previously the text said we fail if block count is set to 1 despite
>> language elsewhere in the text referring to:
>>
>>   "For RPMB read request, one virtio buffer including request command
>>   and the subsequent [block_count] virtio buffers for response data
>>   are placed in the queue."
>>
>> and the existence of both max_wr_cnt and max_rd_cnt configuration
>> variables certainly implying devices should be able to handle
>> multi-block reads just like writes.
>>
>> Fix the description as well as format the steps as an enumerated list
>> to match the style of the previous section describing write handling.
>>
>> Reported-by: Ruchika Gupta <ruchika.gupta@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  virtio-rpmb.tex | 24 +++++++++++++-----------
>>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> Do you want to request a vote for this?

Sure - I think it's a clarification rather than a "new" feature but
whatever is needed to get it merged ;-)

--=20
Alex Benn=C3=A9e

