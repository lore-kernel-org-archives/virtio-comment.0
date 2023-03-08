Return-Path: <virtio-comment-return-4789-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D0AC64EC4
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 13:06:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A072D41A0B
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 13:06:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F2599866F5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 13:06:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 864DE9866EF; Wed,  8 Mar 2023 13:06:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F6739866EE;
	Wed,  8 Mar 2023 13:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6FlbTNRz+BDYx0cX1iRB1t+CPt36OgYfSzVc9x+mwmWonewC5Abrs/RoBQ7PFvmxDWLjs3B4vasm8KDLV9DFnQ17aQvq0FfMg837TsR8Br5EWfbBt2kgcgSYP1x7Wo8j8+uYsFVB8Z36nJ3I98bGoNSFAnRCurJHL+y5YnFYPXCEuxEx3zwQcbU71V4hTo80M3s+54aCvwyJMtuwHTfDDENgO6Z7vs82vXWBrTFjtLSdfLDbnpIgFa2Dg/28spuhrqTjiYxezp4wWhbJJ1b+ynB7HWAlBhgIFIMdHHcenosAIicczK+KyNpujpJwhMyOjiL3ZwChW8iYszwLFiN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoQlaBTHOMbCSCiFD82OqTgCz3e9YOEwxxb7w2FBGYY=;
 b=MBeLQ19Z3CaoiZP+CXx7aPO7ghiDkIT5/YEerYr7nPoMIOo2ldUfDjHf2vKh5QubHOhTQEG0152jyMs+VxlVU8N3peHR2YaIQLTAcKDUleDR8XvYBfa8DYsAZOYSyaKBGd/fQG6EYE7aoo6xTJ0fVCIzu2gWFyjh8VwJE9AbQTp3y3rkZDA4nPny/I2gmYO2fgFgYH0sVJpmUaqSe2d1E4bfdB+d/jABZjgpDzbVajQZZjUmjrQ//6V7W2YbEXiCg/7oI+3hMpavmvPMxvdOvYeZQhsG+3UAQxg+kT1NpfPLzQWVmwRJA5R1/GzG6f/uiU7+ATkCPuDTZpSN+yz2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <992e9a1e-3799-842c-79f3-e66f5c823356@nvidia.com>
Date: Wed, 8 Mar 2023 15:05:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "nrupal.jani@intel.com" <nrupal.jani@intel.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "hang.yuan@intel.com" <hang.yuan@intel.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <910b3607a5f255134d30b3e1233e564f564eafb8.1677761896.git.mst@redhat.com>
 <PH0PR12MB548116853CAC23DF9CA7345EDCB29@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230302201912.GC2554028@fedora>
 <20230302185803-mutt-send-email-mst@kernel.org>
 <20230303131703.GB2866370@fedora>
 <20230303081900-mutt-send-email-mst@kernel.org>
 <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
 <20230307192752-mutt-send-email-mst@kernel.org>
 <6668fd7a-3eb3-0447-9cbf-72d308b1336a@nvidia.com>
 <20230308070531-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230308070531-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::30) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 90792e48-0f73-4f9c-a6f2-08db1fd5dcf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lg8+S+y8TT6G7ZaBjjpm5bOxUE0Dfy14by4E2++HaZbfnH3/q8OTE7oku6m91cvL9f/+VkZaxxFwT3y++D6343do5IeoH4HPnVncIUNYaWBlMjB+TugIwULqdWwR9vWDVQjKMjS+Kks6UwoZak86HDdugo0tfkvAO0VCBmw7J4X3Kj9gn7mWJJ0MMXk+1z7hYNZSC5LD2RhrlKvXdaDr0BO5rCNawKObs70v5u8CvzbnDF729chM6mw5ZwE96mJb+2CQpAgWK669Q+lZ7KkcVIbP/MgeD4VxKnxrJwNAjINd5JaN0M4lZDKdxIXPnc1ugjJsY0VLmUUiFMctb424sYqYYjG3YqjggYh1DoEtm9rmLQDjwuF09xVXJxn4pqE3Oepa+eefgA8LHQx5UtWkajEP+K6OgdZ5gq/c+a2TjNLTi7oFw3HJBwQmaeSejf0Fhi6CnwvCM7oc16SNFUa6slpKA8ZbSphKJiltiHKfJacB2QOGh6kUO6oNufpgfnW/rNzEiowJf8kZ18uvGR/mACAF4CgH6SO4m6ZATSVVntW866MI6n2iEJCD297RK0qmiG4jMAGlkZHFAtGE3M58QhdrQzjWORtZRmvt7kYeF1XIBYD8eFPUcUQ+/v0bnEq61aJmXzXUkZ09jsyciYNMmO9ee4XSPmZVnQ40+WBt8RTdAj6m/KF8wZlGaHeb66NYvubb2cAT0bB/mmvVfqjZILsSZKMMTNNRFbBxLjzXVag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199018)(4744005)(31696002)(8676002)(86362001)(8936002)(6916009)(38100700002)(36756003)(66476007)(66946007)(5660300002)(7416002)(2906002)(66556008)(4326008)(41300700001)(2616005)(186003)(83380400001)(53546011)(6506007)(6512007)(6666004)(316002)(478600001)(107886003)(6486002)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2g0cmN0ZWkvTHBLa2xvT2dTWm41c3hoYnVpWEFFc3lITUlqcWVvOFJYNFhJ?=
 =?utf-8?B?QzFiNG1yTkRpMi8zckk3c2RNVVdsOHFPbUhJdFdzRURxcXdlYisxWnB5SHpL?=
 =?utf-8?B?UjhGdlN3emdMMnF4RjA0NTRyMmVRWUFrMERXQXVQNlg2aEVnajFsQXppWldU?=
 =?utf-8?B?WEhlVExCSlIzVGpVTjRsVHZzQ1RjV0tlcGZuanBYcEE2N09hbG5TVW5nSkN1?=
 =?utf-8?B?a1BPSXUyNkpsQS9HcmV0MWQvTGk2eU5JN0QzbkNnZDVuL0RmeFZBd1cyWXN1?=
 =?utf-8?B?cEV4TnA2VW91OVh5bXRjTjlSUlJudTRmd1JGemxUdytVOHE1OWpRNUQ4TXUx?=
 =?utf-8?B?ek9PNk5Zc2cyRWw2WjFTN3ZHVDFqVEQxZEIrR0g3eDh3NGV3dDhjOGh3MzU1?=
 =?utf-8?B?U2pheUJLNkJWd1ZmQm5CSXMwRmsvUEpIR1hYMnBKUDZFUVhVYjcyS20vRzRV?=
 =?utf-8?B?QWV1SFhCQ1J2L2dqRURhZCt4VW9vZ0svc2dVWmZBVmFhU2VFdFZ6YXZnZTUy?=
 =?utf-8?B?dkJ5RzRFY0VXTG1GU21mWUQ2dGhOdVB0SGxVaFpjMHR3Z3RkSVp3SlNtRzhS?=
 =?utf-8?B?WmNRUitlRm0vMDFEaHJmcmt0eEhPdkF3NGZ5V25pZm9EcVQwdUpIb3RXWmM2?=
 =?utf-8?B?RVU1MkcyeCtTUGJLTXZtNlY0THhUK2IyYXR5SjRYNFVOaFNHZlFZSlJKVXpW?=
 =?utf-8?B?VGQ2T1hpS1JyZmxqSlNQYVdGQlZjbmhwL0ZmUDJKdHRqb2hYQ1pINW82QS91?=
 =?utf-8?B?aEdKTUZQaVdub2ZDMjF3U2VPUEFJZGg2TmQ3K1o2SmlFZ0x0WjlOOVp2ZS9h?=
 =?utf-8?B?ZlpiaVBrcmdIdGxRd2hkOXJkczRrS1loTkJQVFYrN1RHZnZFTEw1M2d4RnJk?=
 =?utf-8?B?NEhOemF4VlVxMkF6VWlsamlBdVFQcTYzN2VvVmFWR2ZpRU54U3NUZ0liSi9i?=
 =?utf-8?B?bDJOYzNuVmd2WEZucWxIeXRlQUJyWVYzOVpET1l4dTYvNzhqUVdCZzhmeWMr?=
 =?utf-8?B?K0kyY21RcHhsNmVMTldpeTgxRlhOV2pmeS9QYjlLM1VWY1d0S1hhOW1rNlli?=
 =?utf-8?B?OTZQa25kZjhEOE05aUNuYUhHcUxjSU5KNXdMazA4Uzc3WEVoSzU2OG5na3RX?=
 =?utf-8?B?SVhPanJvSkh1U0lrdU0yeFBHM1VONkxreDZRTHZscGF4N3E0TTU4M0VGNmRS?=
 =?utf-8?B?a25vZmpjZWZXSDBKcFd6MDNxOVdWYnBlbDRCdmhWUlI4TmtGWlRmQkNKK095?=
 =?utf-8?B?V2x2ZXZHdTJ5LzlnSjdJZVVSTnZXYmUvVWFEOTBPVHRZVEc4MWlKOTh0WGQv?=
 =?utf-8?B?eFA1UEpGalA0aWg5M0Y4LytLb2NlZlV0Zm9nSkJjenpZZzRtREIveThYbDUw?=
 =?utf-8?B?M3QxSVVWQUdnMDV4bmR0M1NONStiRElkOVZNaEF6ekpWZE5MM3p2QjRGZS9S?=
 =?utf-8?B?dmJPbkp5MlpkdjBSK2NWaXJyOHV3bkV0NXNRUHpmaU5hSUY0b1hNNzBuaFJ1?=
 =?utf-8?B?cjhBZFB6ckR4ekNad2xjYWdMTmVjc1dzTTBWblFRMC82RHhOYkFvVG4vWjBI?=
 =?utf-8?B?K05YazY1MnVFV1JYTlk1S01HMjlZWC9mL2JXU3p2NVJYbkZia05xMFB5ZEF0?=
 =?utf-8?B?dU91UGY5clJ4OGZyRVV6UUY4TUl4YTRtSFV6bE8wUjZwRERZcDhpVzY5VUxj?=
 =?utf-8?B?cmtxZWg4NHlQUGF5UFc5ejNxUnV2TVJJdWQvRnVlZXY2bTRaRlhpMytJTzlS?=
 =?utf-8?B?NW1mcXZSWEdIUGNURVZ4MEVRUVJmcXN5Yk9XZm9yellVeW92NHFrallMK1RP?=
 =?utf-8?B?Si9KZjVPQTFJMXExUjdNang4dWNkbHBrMVpWeGprYzRmMFV1YmZ2YVRad3lS?=
 =?utf-8?B?c3JLMk45ckUwVDBURFpHNFJ3SE92bFVzMTBLdmhBc1FwdEJZQjc3NTBzQm15?=
 =?utf-8?B?eHFBYmRoNUdkOGNkQVYwVkhWWlp1OGdCQWdVTlBmTW8zNXRhakhSS29xK050?=
 =?utf-8?B?MGg5cXBidk8wbGF1cHNvNXhmZ29RNWYzNUlaZkZnMHI2S2JlTVJ3a3JxMXBP?=
 =?utf-8?B?MFNOOE1xa0VtcGFFcDRRdGh5QW9WTTJYT1ZycUxPSGU3SWsybU5oQXRIRHZL?=
 =?utf-8?B?azJXZjd5Z25xQXV5UEpXLzlZekZrYnF1dGIwQ2hURU84bnpCMHVjalZ2aTVm?=
 =?utf-8?B?bWEvT3N4bzVYLy9hVXZmTUN6dXE1K0EzSVpzaVo1aHVXUy9SYjlPbWc2ekY2?=
 =?utf-8?B?ZE1BVzBNNStldEViMi9ZVHVrMFR3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90792e48-0f73-4f9c-a6f2-08db1fd5dcf7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:06:00.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTMJjqxeJxL+v1yU2jefcn4rAE33K7KqF2PJ2Vd/dDeaiFTmbbbPnWSYKQT5J3zMK/8baG7I7SrzGAaqn2JL5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710
Subject: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group administration commands



On 08/03/2023 14:07, Michael S. Tsirkin wrote:
> On Wed, Mar 08, 2023 at 12:55:37PM +0200, Max Gurtovoy wrote:
>>>> 5. VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR (for more info read the
>>>> command_specific_error field).
>>>
>>> I don't think it's a good idea, we'll have to agree to disagree.
>>
>> Ok.
>> can you explain why isn't this a good idea please ?
> 
> Pointless complexity for spec, devices and drivers. In the end drivers
> don't really do anything with all this detailed info.
> 

Pointless according to your own opinion. As I mentioned, other 
specifications and devices work this way. I didn't invent it.

All drivers in SW world ? All drivers in Linux ? or Virtio drivers ?

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

