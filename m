Return-Path: <virtio-comment-return-4884-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49578C74A5B
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 10:44:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6728A42A68
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 10:44:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B3B5986411
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 10:44:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B2A29863FC; Wed, 15 Mar 2023 10:44:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24B13986402;
	Wed, 15 Mar 2023 10:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CS61S5CNDfIy7Wryu2y0ZmRgi27XEiIkhEQZfMSbsgi6+fOGlR0jmka37M/SOjDkP0mEFZEYdC6pr+XRflin8DIasK6e3Qm/HqnpvG1qHEIHyq9Kb76yqCB0xD5qS4AGjuzdbFG7q8eWWL6qsqc2P+mjIZHnetW5kpyo5FCO7h2vm0Vd8CKuJsTv1O/+KUrQXAjfnbty90PlXEQKxUUsoSPNfTFe2S3FVQABLXyrxupi8QMznZDqHUpzUY/aFeNmwDhCI7gQVC+2TYioL8O5JQ4JHmCd5hRcjzw8ZWMM3x+CnktQyVl/wpdtalPlCQpzaORhLMd4DVRMVp6Cz3Zs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cut75FnP0Rr11ZBtnfGGtb1dzM8e+FFI6KaMRrDmkEw=;
 b=R3uE61/xVJOD5QMV/+T40F8txilWdYecKFKO7IdBmrzIYrOZIe8vdGXIsNrGhXLYqZI4scFMPeKVBoTjENKo5sNrj+u0mALhCpjUGJR1/Vers07KMolROKGV8+n5lOyIO+kN8DYaqzcZV/+WiwXXMu5rHiWc5/+jFwY9lxuidHnvBc89U/qSINUwIoFpskByJHjNEemeVFWsBINNu3KYx1+MYQeU2QzFpnwRV5oscjbmp4z0+uKcNbjdwQZyDv/QV5kbT2W/T3KS30dFl7Q9VooSnirLrKnvuwkt+mDEtvIi6wSd0GUzwpwG6km6d8xz1yDxTHpVbrBvkDHOSPfiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <d2f996c0-8fe7-3f0e-a6a6-f8705ee9c209@nvidia.com>
Date: Wed, 15 Mar 2023 12:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
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
 <20230302184447-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230302184447-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0240.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::20) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SA0PR12MB4510:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8f2821-5050-433d-def2-08db25424780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D1rAmh/KOVQQiDqWES+rqXIJ0lHMLdAQzQrVu/f/L4i2uKYIEZ9UlDuA5U58amMtuBz+zLmKsPi1Up6Z7/Mz6jW/P7KYHQCuN0DZTj6IkEj/sobp6p5BH+6nM1I7gdwwkRv1+edz8yyFnVC35BTUa8n8lW4APiv/SOHhTk4i5SiRrZSvREkC6pECB9PjW5NQ7F0aJwryjsVc8+HP8wiWh9OHdiOebVcT0tsnYHnUC1ZOcDinXHQyBdbaRY0aceh6clLYC0IYA8Dvmakk+Tqe0yleC5kN6WPTDuGR2sw+5b1yr6A4AaIoKe8tjpTYgaqnxGxPuKHJiDl8H6sxZRgS8WrMEThyvmXpLt9ZhkUA0diVMPQNPTap4ayxtUTKt+DZK60Y4EGB9qKV5A+iNINJJ6Nxqa9beAlKVHupjgqQGai016zmqBjvWdtSI//pHLufg/V+KfmBqxiIBDQctJypPhD2RHvw1rY+E8TVrG8eWS//V6Ft0r11XuQx9GxPrKP31HtpWUgOp8ix/AUcseWWY1WYFHD4csAVG2o3RmX1TEh1xDrEdgAb3X9NldFbndPoVZpTTsrbe9R8cvzrI9yCZQieh4FB2LnjmBHOVvYx6Mbowei9D9k65dmrrKbnngRCQTkgk53KtpwQCRhrwiW31Ia7P+dsu12Jb6qBHQPZ4URhbl/hOnTkfv0JOOXF/6/LUN6ovmQCOM7UL92ysHkgucUZM7AKreOnqiLNw5j4QY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199018)(2906002)(31686004)(83380400001)(5660300002)(7416002)(36756003)(66476007)(66946007)(8936002)(8676002)(41300700001)(31696002)(4326008)(38100700002)(54906003)(110136005)(86362001)(316002)(6636002)(478600001)(66556008)(186003)(6512007)(2616005)(6486002)(6506007)(107886003)(26005)(53546011)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U081bHlmVXlSbGZZdk9LbDdXNXV4c0w3ajAzenRqNFE2YlhyaXFNMExhZldo?=
 =?utf-8?B?SWJnQzlESEQ3UFhLRE1nYXZtclhOck1ET21tbW54d2VWakNscDYxZ2sxK0FR?=
 =?utf-8?B?TE52ekt1bDRJTW1DUGFjTUJsNGZMdExIWEpxSitQcE05N3RsVkFYTzQ3dFB1?=
 =?utf-8?B?TFNYaWRNUlJhVFdMQ0V4d0FvbDVKSGk5NUF3aFdjSWlWTGwxcWVEbFl1MVJZ?=
 =?utf-8?B?NnQwTk9JbmFmRGxZeTVtdTNDT3lib0IzUEw1L3oxOFB5K2J3dzFveUVQUlMz?=
 =?utf-8?B?YVZxMlE4RGhJQW1KTnBZK1NSa1N2QW9RSjI2NWFaRFhRUFY2bTBTMXo4eHFU?=
 =?utf-8?B?cEQzY1pQR3hyZEpsZmFqQklTNTI5NU1uS1VRYkY3WUlsZFJyd20yRlh3aFdD?=
 =?utf-8?B?a3h5eW1IQnkvb1Fuc0REaXV1SXVURS84SVY4VDA2RGpaYzlWcDBGQzVrbldJ?=
 =?utf-8?B?MVJEdU9ZTndvQWJKSEFvcmdJaUt2bDhoUW9weWV4Rkh6NHN1cmVtU0lFOUtT?=
 =?utf-8?B?dDJHMDBLdGsyUWJYK0VOR3ZsRTJpRmZURGxnNDdCS09qbXR2R3VyYVhqbXoy?=
 =?utf-8?B?a1ovOVRoemNPVkJ3VFA2RFJSTWYxcTk0bXdwRUJMRkFNME9VaGpPa05wSnN2?=
 =?utf-8?B?Mzd6R0UyMThGQWFxaGZmQTlRcG9jcW85dWhRVGZXZDJzSC9OVTZBaWFZcW5x?=
 =?utf-8?B?WDlRSUE3L0NkMEJvUkVtY1F6dm1JY2JrSHNlR1dMK2dIQmREMWt5WVlkd1ZC?=
 =?utf-8?B?SjY1UVE3WEFoTktyTWNwS3Q4dXNkVVZyOVBSUmpPbnQ0Z3NqV0l0M0ErMXJM?=
 =?utf-8?B?cy91V0JRWHNtSkFDc291QTlicXhTNm4zWnh1ODJiRi9QaGp2dUhqYzVqYUZL?=
 =?utf-8?B?R281Q25QcFpGMmdQRW8rUE84SUo4ano0T1l3QVdXTWhLVlg2VGxzbmxac0xD?=
 =?utf-8?B?aGdkNTB1bE5xb00rZWIwMGV0eXlrVTkvTXBhY05aYkczalJpd0NWYy9jTDZ3?=
 =?utf-8?B?MGl2NlVOU2xJdW14YUJtSms5bFp1Zm95WGczaGtuSFJRb3ZrR0JoNVVMVEVY?=
 =?utf-8?B?WnNkMWVkNXFpbXpmbkxHS2VPTy80MjFPdW9SZFZVK0R3aU1zNXVFU1M4bmxn?=
 =?utf-8?B?L0Z2eDJHcUQvUVBVcHZtMTNMWHY0M3B0amc2SGdNSWsraWd6NDE5MHdaaWhr?=
 =?utf-8?B?dGhlMUo5OWozYzB6dk80U3k0QkVZMGxWSGo2bnBCcTJDQnpQbWRPL2RiQmpU?=
 =?utf-8?B?c3JIL0RRRitwS2Exc0o5dWZlaGEvK3IyazlJVnFZNFI4S2JxWFkxM0E4Q0R1?=
 =?utf-8?B?eHpPb1A5ZCtibXNxdlpramZqdE9hZjMvNEROWG9hWnVlcTZpenJCcG5WQXBK?=
 =?utf-8?B?TklwdURvR3BHOEU3NUpjdXJrbU9rVDRPZFZmdm9uRDNUcmFKZ3VsejFaUFox?=
 =?utf-8?B?RWZScHk3WUlUUklYeW0zZnZkUElUTHkrdjlBWkZvcldVYjFTSDd0U1haTXV4?=
 =?utf-8?B?NzRzRWkvMVpWa0JUMHlDQTVtQzVxN2t1cktmcVV6SGZHTlJtZE9EcmJLL2Q0?=
 =?utf-8?B?U2VKbW5jUmZ3dHY3b3Z0MXFPSFVHWnhjNTIvWFlvMXRzZHN5aWxvckZVenps?=
 =?utf-8?B?VHV2MFB4dndPZG9qenp6Smp1STdtVnhPMm5OOVlSQ1VmdldlM1pNR3hnQmZw?=
 =?utf-8?B?SEhSNWdsN2J5ZjRlb0NaODl5WHY5SjFUYXY1YXlDOGd0QVZ5WXRuOFgzYWFI?=
 =?utf-8?B?L1VYTzFnY05UTVJpd2NyaGo4ZDQrc0d6d1lKRlB4R2VaekxuTWtmc01vNzI2?=
 =?utf-8?B?dnhRTkpoSlVWSVYwcmp3VmFQZU9vVlVkS3VYU0VBb1o4cktrSHdwdTJnc3lm?=
 =?utf-8?B?ZGFmL0RraU9TZGZoa2RWeE44eUdvblZJTWswcUJ3U0tnbXhjbVN0WHZEbDh6?=
 =?utf-8?B?cy9obWQ5dlp3K25Xdm5FTjBRUDVja1NyQTZQZStxVzdyQ0luR2dwdE5MekpR?=
 =?utf-8?B?NTF2WW5scU1qTTM1Q0tCQ0cybW9EeWhnOG5uQkJWTEtXUUx0SGhsc1FsSGVC?=
 =?utf-8?B?dWVnTmRTeVNDeXFnbGxyTTU3S1hhMWcwT0hXV3JKMFNrbkpoS0ZNK3ZacjhO?=
 =?utf-8?B?QXJzeHVUT3hqSlI1QWFINzBtOWZ2VVJZbVd4dXNabUVKb3ZlNEJLeDZwSWRp?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8f2821-5050-433d-def2-08db25424780
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:44:40.3071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSywrMXWI3QgEm+jULTKdtAXbAIbwet16nQK/9Tx6+jasYkXuUVcmoQ23Gjss/JGhms9tbREMISnORffA0b+SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Subject: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group administration commands



On 03/03/2023 1:47, Michael S. Tsirkin wrote:
> On Thu, Mar 02, 2023 at 06:40:29PM +0000, Parav Pandit wrote:
>>
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Thursday, March 2, 2023 8:05 AM
>>
>>> +When \field{status} is VIRTIO_ADMIN_STATUS_OK, \field{status_qialifier}
>>> +is reserved and set to zero by the device.
>>> +
>> s/status_qialifier/status_qualifier
>> Missed from v10 of Feb.
>>
>>> +When \field{status} is VIRTIO_ADMIN_STATUS_EINVAL, the following table
>>> +describes possible \field{status_qialifier} values:
>> s/status_qialifier/status_qualifier
>>
>> Can you please add other useful error codes in addition to the EINVAL?
>> Few that we are needed EAGAIN, ENOMEM, EBUSY, ENODEV.
> 
> We'll add them when there's a use-case.

Can you please add at least the EAGAIN in v11 ?
HW devices my be in a transitional state in which the command can't 
succeed in time T but the same command may succeed if it retried in time T'.

This is very common in linux as well and it's will improve the virtio AQ 
spec.

We as device developers need more that one type of error.

Definition:
VIRTIO_ADMIN_STATUS_EAGAIN - command may succeed if retried


> 
>> And with that, VIRTIO_ADMIN_STATUS_Q_INVALID_MEMBER moves under ENODEV error code.
> 
> 
> No I think that belongs in in EINVAL - command is malformed.
> ENODEV is more "The wrong type of device was given to a function that
> expects a particular sort of device."
> 
> 
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Status & Name & Description \\
>>> +\hline \hline
>>> +0x00   & VIRTIO_ADMIN_STATUS_Q_INVALID_COMMAND   & command
>>> error: no additional information  \\
>>> +\hline
>>> +0x01   & VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE    & unsupported or
>>> invalid \field{opcode}  \\
>>> +\hline
>>> +0x02   & VIRTIO_ADMIN_STATUS_Q_INVALID_FIELD    & unsupported or
>>> invalid field within \field{command_specific_data}  \\
>>> +\hline
>>> +0x03   & VIRTIO_ADMIN_STATUS_Q_INVALID_GROUP    & unsupported or
>>> invalid \field{group_type} \\
>>> +\hline
>>> +0x04   & VIRTIO_ADMIN_STATUS_Q_INVALID_MEMBER    & unsupported or
>>> invalid \field{group_member_id} \\
>>> +\hline
>>> +0x05-0xFFFF   & -    & reserved for future use \\
>>> +\hline
>>> +\end{tabular}
> 

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

