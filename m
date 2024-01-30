Return-Path: <virtio-comment-return-9030-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409BDC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 05:21:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 721BE2AC58
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 05:21:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4771E98688A
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 05:21:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 20C38983F76; Tue, 30 Jan 2024 05:21:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 10A95986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 05:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
Message-ID: <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com>
Date: Tue, 30 Jan 2024 08:21:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Yiwei Zhang <zzyiwei@chromium.org>, Ryan Neph <ryanneph@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Sergio Lopez <slp@redhat.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 virtio-comment@lists.oasis-open.org
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

On 1/30/24 04:34, Gurchetan Singh wrote:
> On Sun, Jan 28, 2024 at 11:12 AM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> 
>> Document new virtio-gpu protocol fence-passing feature that extends 3d
>> submit command with support of in-fences which are passed from guest to
>> host for waiting. This feature allows to offload waiting for in-fences
>> from guest to host, where it can be done more efficiently.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
>>  1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/device-types/gpu/description.tex
>> b/device-types/gpu/description.tex
>> index 443524851a05..e5e23b5c9072 100644
>> --- a/device-types/gpu/description.tex
>> +++ b/device-types/gpu/description.tex
>> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU
>> Device / Feature bits}
>>    resources is supported.
>>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
>>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
>> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from guest to host
>> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
>>  \end{description}
>>
>>  \subsection{Device configuration layout}\label{sec:Device Types / GPU
>> Device / Device configuration layout}
>> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq
>> (3d)}\label{sec:Device Types / GPU Dev
>>
>>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
>>    Submit an opaque command stream.  The type of the command stream is
>> -  determined when creating a context.
>> +  determined when creating a context.  Request data is
>> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size} field describes
>> +  the size of \field{cmd_data} array in bytes.  The \field{num_in_fences}
>> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled, otherwise
>> +  \field{num_in_fences} is treated as zero.  The array of
>> \field{in_fences}
>> +  IDs is placed in between the \field{num_in_fences} field and the
>> +  \field{cmd_data} array.  The \field{in_fences} array contains virtio-gpu
>> +  \field{fence_id}'s corresponding to the out-fence IDs of a previous
>> +  3d submits.
>> +
>> +\begin{lstlisting}
>> +struct virtio_gpu_cmd_submit {
>> +        struct virtio_gpu_ctrl_hdr hdr;
>> +        le32 size;
>> +        le32 num_in_fences;
>> +        le64 in_fences[num_in_fences];
>> +        u32 cmd_data[size/4];
>> +};
>> +\end{lstlisting}
>>
> 
> Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?

We haven't made use of this flag in the experimental/prototype version
that was made for the native contexts. The flag is unused by both Qemu
and CrosVM.

We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and it's
deemed to be enough. If the UAPI flag isn't set for a job's out-fence,
then guest uses guest-side synchronization for this fence when it's
passed as in-fence for the further jobs.

The FENCE_SHAREABLE flag isn't needed by nctx/virgl/venus protocols. All
fences are shareable by default. If VMM fails to export fence, it is
treated like fence was already signaled. In case of Venus, it's up to
Venus to decide internally which fences can be made shareable, i.e. both
guest and virglrenderer Venus implementations are responsible for making
decision whether fence should be made exportable. Venus won't make
out-fence exportable for internal intermediate jobs and will encode this
export-info within the Venus protocol.

Whether FENCE_SHAREABLE virtio-gpu flag will be needed by gfxstream is
questionable. Gfxstream should be similar to Venus, i.e. you should be
able to add flag to the gfxstream. We'll need to be certain that the new
common flag is definitely needed by making use of it before specifying
it in the stable virtio-gpu protocol.

-- 
Best regards,
Dmitry


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

