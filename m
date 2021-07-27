Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [virtio-comment] Re: [RFC PATCH v2 2/2] virtio-blk: add support
 for VIRTIO_F_ADMIN_VQ
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210726165254.8529-2-mgurtovoy@nvidia.com>
 <YP/6/5Dw38qXPGHd@stefanha-x1.localdomain>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <e64d3167-2673-2e03-a1e4-d1819522d345@nvidia.com>
Date: Tue, 27 Jul 2021 19:08:52 +0300
MIME-Version: 1.0
In-Reply-To: <YP/6/5Dw38qXPGHd@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 7/27/2021 3:24 PM, Stefan Hajnoczi wrote:
> On Mon, Jul 26, 2021 at 07:52:54PM +0300, Max Gurtovoy wrote:
>> Set the relevant index in case of VIRTIO_F_ADMIN_VQ negotiation. Also
>> restrict the negotiation of VIRTIO_F_ADMIN_VQ to be possible only if
>> VIRTIO_BLK_F_MQ is negotiated.
>>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> ---
>>   content.tex | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index d350175..03e25da 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -4406,6 +4406,16 @@ \subsection{Virtqueues}\label{sec:Device Types / Block Device / Virtqueues}
>>    N=1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
>>    \field{num_queues}.
>>   
>> + If VIRTIO_F_ADMIN_VQ is negotiated, queue0 is an admin virtqueue and the
>> + request queues are shifted as the following:
> "as follows:"
>
>> +\begin{description}
>> +\item[1] requestq1
>> +\item[\ldots]
>> +\item[N] requestqN
>> +\end{description}
>> +
>> + if VIRTIO_BLK_F_MQ is not negotiated, VIRTIO_F_ADMIN_VQ MUST NOT be
>> + negotiated.
> Why?

To distinguish between adminq and requestq.


