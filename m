Return-Path: virtio-return-3441-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
References: <20201030061222-mutt-send-email-mst@kernel.org>
 <20201030102339.GB3046@work-vm>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2b6a81de-089d-aaad-7c74-78b6f534164e@siemens.com>
Date: Fri, 30 Oct 2020 11:30:09 +0100
MIME-Version: 1.0
In-Reply-To: <20201030102339.GB3046@work-vm>
Subject: [virtio] Re: [virtio-comment] allocating device IDs without a vote
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 30.10.20 11:23, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
>> At the Virtio BoF at the virtual KVM forum, 2020, a recurring theme was
>> the difficulty contributors face in obtaining device IDs for new
>> devices. As allocating a new ID is a technicality, and can not break
>> existing devices, it does not sound too bad to skip a voting step in
>> that process.
> 
> It would seem reasonable to define what the expectations, if any are,
> about the use of those IDs:
> 
> Is it expected that the allocator of such an ID would eventually
> end a request to merge a spec for the device, or are they free
> not to?
> 
> If merging is expected, then is it acceptable to recycle IDs that have
> not been defined after n-Years.
> 

Lowering the barrier for grabbing IDs too much and not establishing a
garbage collection mechanism can eventually shoot back, IMHO.

Jan

> Dave
> 
> 
>> I'd like to hear TC's take on such an idea.
>>
>> This would be similar to the existing standing rule:
>>
>> 	Minor cleanups, including editorial formatting changes, spelling
>> 	and typo fixes can be committed directly into git for approval as part
>> 	of the next specification approval ballot.
>>
>> -- 
>> MST
>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

